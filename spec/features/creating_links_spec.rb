require 'database_cleaner'
require './app/models/bookmark'

def setup_test(title = 'Twitter', tag = 'Social', url = 'www.twitter.com')
  visit '/links'
  click_button('Add link')
  fill_in :title, with: title
  fill_in :tag, with: tag
  fill_in :link, with: url
  click_button('Submit')
end

feature 'add links' do
  before do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  after do
    DatabaseCleaner.clean
  end

  scenario 'creates and displays them links' do
    setup_test
    expect(page).to have_content('Twitter: www.twitter.com ["Social"]')
  end

  scenario 'adds tags' do
    setup_test
    link = Bookmark.first
    expect(link.tags.map(&:category)).to include('Social')
  end
end

feature 'shows links by tag' do
  before do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  after do
    DatabaseCleaner.clean
  end

  scenario 'shows links by tag \'Bubbles\'' do
    setup_test 'Bubbles.com', 'Bubbles', 'www.bubbles.com'
    visit '/tags/bubbles'
    expect(page).to have_content 'Bubbles.com: www.bubbles.com ["Bubbles"]'
    expect(page).to_not have_content 'Twitter: www.twitter.com ["Social"]'
  end
end
