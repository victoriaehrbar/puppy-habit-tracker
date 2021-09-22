class PupdatesController < ApplicationController

    get '/pupdates/new' do
        erb :'pupdates/new'
    end

    post '/pupdates' do
        if !logged_in
            redirect '/'
    end

    if params[:content] != ""

    else
        redirect '/pupdates/new'
end