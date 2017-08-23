require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper.setup(
  :default, ENV['DATABASE_URL'] ||
  "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}"
)

# lib/bookmarks.rb
class Bookmark
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :link, String
end

DataMapper.finalize
DataMapper.auto_upgrade!
