require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

# lib/bookmarks.rb
class Bookmark
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :link, String
end
