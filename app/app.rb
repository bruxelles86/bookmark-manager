require 'sinatra/base'
require_relative './models/link.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

end
