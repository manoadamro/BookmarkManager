require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'

# DataMapper.setup(
#   :default,
#   "postgres://isynnryfyejdfx:" \
#   "9872efef4477145fb14a1a5e2fec790887dfdf48b7d56dd0e4beeebae9c07333" \
#   "@ec2-54-225-119-223.compute-1.amazonaws.com" \
#   ":5432/ddoo4ijuh4ul5m/bookmark_manager_#{ENV['RACK_ENV']}"
# )

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
