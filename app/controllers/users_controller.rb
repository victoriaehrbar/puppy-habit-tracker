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
          flash[:errors] = "Your credentials were invalid.  Please sign up or try again."
          redirect '/login'
        end
      end

    get '/signup' do
      erb :signup
    end

    post '/users' do
      if params[:name] != "" && params[:email] != "" && params[:password] != ""
        @user = User.new(params)
        redirect "users/#{@user.id}"
      else

    end

    get '/users/:id' do
      @user = User.find_by(id: params[:id])
      erb :'/users/show'
    end

end