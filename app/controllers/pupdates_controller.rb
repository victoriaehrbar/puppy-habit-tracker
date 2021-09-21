class PupdatesController < ApplicationController

    get '/pupdates/new' do
        erb :'pupdates/new'
    end

    post '/pupdates' do
        if !logged_in
            redirect '/'
    end

end