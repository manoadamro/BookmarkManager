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

  get '/tags/:name' do
    tag = Tag.first(category: params[:name])
    @bookmarks = tag ? tag.bookmarks : []
    erb(:links)
  end

  post '/links' do
    link = Bookmark.create(
      title: params[:title],
      link: params[:link]
    )
    params[:tag].split(', ').each do |t|
      tag = Tag.first_or_create(category: t.delete(' ').downcase)
      link.tags << tag
    end
    link.save

    redirect '/links'
  end
end

App.get '/*' do
  'NAH M89, 404'
end
