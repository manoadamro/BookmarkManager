
# lib/bookmarks.rb
class Bookmark
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :link, String
end
