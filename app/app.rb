ENV['RACK_ENV'] ||= 'development'

require_relative './data_mapper_setup.rb'
require 'sinatra/base'

class BookmarkManager < Sinatra::Base
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

end
