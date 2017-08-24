
# lib/bookmarks.rb
class Bookmark
  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :title, String
  property :link, String
end
