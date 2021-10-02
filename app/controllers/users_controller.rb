class UsersController < ApplicationController

    get '/login' do
        erb :login
    end

    post '/login' do
        @user = User.find_by(email: params[:email])
        
        if @user && @user.authenticate(params[:password])
         
          session[:user_id] = @user.id 
    
          flash[:message] = "Welcome, #{@user.name}!"
          redirect "users/#{@user.id}"
        else
          flash[:errors] = "Invalid credentials--please sign up or reenter correctly."
          redirect '/login'
        end
      end

    get '/signup' do
      redirect_if_logged_in
      erb :signup
    end

    get '/about' do
      # @user = current_user
      if logged_in?
        flash[:message] = "Welcome, #{current_user.name}!"
      else 
        flash[:message] = "please login"
      end
    end

    post '/users' do
      @user = User.new(params)
      if @user.save
        session[:user_id] = @user.id 
        flash[:message] = "Account creation successful. Welcome, #{@user.name}!"
        redirect "users/#{@user.id}"
      else
        flash[:errors] = "Could not create account: #{@user.errors.full_messages.to_sentence}"
        redirect '/signup'
    end
  end

    get '/users/:id' do
      @user = User.find_by(id: params[:id])
      redirect_if_not_logged_in
      erb :'/users/show'
    end

    get '/logout' do
      session.clear
      redirect '/'
    end

end
