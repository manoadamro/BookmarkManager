ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'data_mapper_setup'

# in app.rb
class App < Sinatra::Base
  get '/' do
    redirect '/links'
  end

  get '/links' do
    @bookmarks = Bookmark.all
    erb(:links)
  end

  get '/links/new' do
    erb(:add_link)
  end

  post '/links' do
    link = Bookmark.create(
      title: params[:title],
      link: params[:link]
    )
    tag = Tag.first_or_create(category: params[:tag])
    link.tags << tag
    link.save

    redirect '/links'
  end
end
