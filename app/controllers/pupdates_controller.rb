class PupdatesController < ApplicationController

    get '/pupdates' do
        @pupdates = Pupdate.all 
        erb :'pupdates/index'
    end
    
    get '/pupdates/new' do
        redirect_if_not_logged_in
        erb :'pupdates/new'
    end

    post '/pupdates' do
        redirect_if_not_logged_in
    if params[:content] != ""
        @pupdate = Pupdate.create(content: params[:content], user_id: current_user.id, title: params[:title])
        flash[:message] = "Pupdate created." if @pupdate.id
        redirect "/pupdates/#{@pupdate.id}"

    else
        flash[:errors] = "Please provide content for your pupdate."
        redirect '/pupdates/new'
    end
end

    get '/pupdates/:id' do
        set_pupdate
        erb :'/pupdates/show'
    end

    get '/pupdates/:id/edit' do
        redirect_if_not_logged_in
        set_pupdate
        if authorized_to_edit?(@pupdate)
            erb :'/pupdates/edit'
        else
            redirect "users/#{current_user.id}"
        end
    end
     

    patch '/pupdates/:id' do
        redirect_if_not_logged_in
        set_pupdate
            if @pupdate.user == current_user 
                @pupdate.update(content: params[:content])
                redirect "pupdates/#{@pupdate.id}"
            else
                redirect "users/#{current_user.id}"
            end
        end

    delete '/pupdates/:id' do
        set_pupdate
        if authorized_to_edit?(@pupdate)
            @pupdate.delete
            flash[:message] = "Pupdate deleted."
            redirect '/pupdates'
        else
            redirect '/pupdates'
        end
    end

    private

    def set_pupdate
        @pupdate = Pupdate.find(params[:id])
    end

end