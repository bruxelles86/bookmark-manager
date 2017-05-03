ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/link.rb'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize.auto_upgrade!

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
