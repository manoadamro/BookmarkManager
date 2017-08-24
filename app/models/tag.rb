require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

# lib/bookmarks.rb
class Tag
  include DataMapper::Resource
  property :id, Serial
  property :catagory, String
end
