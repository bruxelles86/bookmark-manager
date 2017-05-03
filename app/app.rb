require 'sinatra/base'
require_relative './models/link.rb'

class BookmarkManager < Sinatra::Base
  get '/' do

  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end
end
