require 'database_cleaner'
require './app/models/bookmark'

feature 'add links' do
  before do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  after do
    DatabaseCleaner.clean
  end

  def setup_test
    visit '/links'
    click_button('Add link')
    fill_in :title, with: 'Twitter'
    fill_in :tag, with: 'Social'
    fill_in :link, with: 'www.twitter.com'
    click_button('Submit')
  end

  scenario 'creates and displays them links' do
    setup_test
    # expect(page).to have_content('[Social] Twitter: www.twitter.com')
  end

  scenario 'adds tags' do
    setup_test
    link = Bookmark.first
    expect(link.tags.map(&:category)).to include('Social')
  end
end
