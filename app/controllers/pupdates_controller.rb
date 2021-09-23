class PupdatesController < ApplicationController

    get '/pupdates' do
        @pupdates = Pupdate.all 
        erb :'pupdates/index'
    end
    
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
        set_pupdate
        erb :'/pupdates/show'
    end

    get '/pupdates/:id/edit' do
        set_pupdate
        if logged_in?
            if authorized_to_edit(@pupdate)
                erb :'pupdates/edit'
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    patch '/pupdates/:id' do
        set_pupdate
        if logged_in?
            if @pupdate.user == current_user 
                @pupdate.update(content: params[:content])
                redirect "pupdates/#{pupdate.id}"
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    delete 'pupdates/:id' do
        set_pupdate
    end

    private

    def set_pupdate
        @pupdate = Pupdate.find(params[:id])
    end

end