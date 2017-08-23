require 'sinatra/base'
require_relative './models/bookmark'

ENV['RACK_ENV'] ||= 'development'

# in app.rb
class App < Sinatra::Base
  get '/links' do
    @bookmarks = Bookmark.all
    erb(:links)
  end

  get '/links/new' do
    erb(:add_link)
  end

  post '/links' do
    Bookmark.create(title: params[:title], link: params[:link])
    redirect '/links'
  end
end
