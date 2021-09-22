class PupdatesController < ApplicationController

    get '/pupdates/new' do
        erb :'pupdates/new'
    end

    post '/pupdates' do
        if !logged_in?
            redirect '/'
    end

    if params[:content] != ""
        @pupdate = Pupdate.create(content: params[:content], user_id: current_user.id, title: params[:title], mood: params[:mood])

    else
        redirect '/pupdates/new'

    end
end

    get '/pupdates/:id' do
        @pupdate = Pupdate.find(params[:id])
        erb :'/pupdates/show'
    end

    get '/pupdates/:id/edit' do
        @pupdate = Pupdate.find(params[:id])
        erb :'pupdates/edit'
    end

    patch '/pupdates/:id' do
        "Hello World"
    end

    private

    def set_pupdate
        @pupdate = Pupdate.find(params[:id])
    end

end