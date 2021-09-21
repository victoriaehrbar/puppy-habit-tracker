class PupdatesController < ApplicationController

    get '/pupdates/new' do
        erb :'pupdates/new'
    end

end