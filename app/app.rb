require 'sinatra/base'

ENV['RACK_ENV'] ||= 'development'

DataMapper.setup(
  :default, ENV['DATABASE_URL'] ||
  "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}"
)

require_relative './models/bookmark'
require_relative './models/tag'

DataMapper.finalize
DataMapper.auto_upgrade!

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
    Bookmark.create(title: params[:title], link: params[:link])
    redirect '/links'
  end
end
