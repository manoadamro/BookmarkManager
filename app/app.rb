require 'sinatra/base'
require_relative './models/bookmark'


# in app.rb
class App < Sinatra::Base

  get '/links' do
    output_string = ""
    Bookmark.all.each do |bookmark|
      output_string << bookmark.title + " " + bookmark.link
    end
    output_string
  end

end
