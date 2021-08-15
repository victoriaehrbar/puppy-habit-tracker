class UsersController < ApplicationController

    get '/login' do
        erb :login
    end

    post '/login' do
        @user = User.find_by(email :params[:email])
        @user.authenticate(params[:password])
    end

    get '/signup' do
    
    end

end