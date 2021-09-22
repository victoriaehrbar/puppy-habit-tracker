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

    get '/journal_entries/:id' do
        set_journal_entry
        erb :'/journal_entries/show'
    end
end