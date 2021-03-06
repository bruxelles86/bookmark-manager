ENV['RACK_ENV'] ||= 'development'

require_relative './data_mapper_setup.rb'
require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tags = params[:tags].split(',')
    tags.each { |tag| current_tag = Tag.first_or_create(name: tag.strip)
      link.tags << current_tag
    }
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb(:'/links')
  end

  post '/users' do
    user = User.create(email: params[:email],
              password: params[:password])
    session[:user_id] = user.id
    redirect to('/links')
  end

  get '/users/new' do
    erb :'users/new'
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

end
