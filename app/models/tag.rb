
# lib/bookmarks.rb
class Tag
  include DataMapper::Resource
  property :id, Serial
  property :catagory, String
end
