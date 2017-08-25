
# lib/bookmarks.rb
class Tag
  include DataMapper::Resource

  has n, :bookmarks, through: Resource

  property :id, Serial
  property :category, String
end
