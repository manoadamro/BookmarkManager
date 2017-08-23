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

  scenario 'creates and displays them links' do
    visit '/links'
    click_button('Add link')
    fill_in :title, with: 'Twitter'
    fill_in :link, with: 'www.twitter.com'
    click_button('Submit')
    expect(page).to have_content('Twitter: www.twitter.com')
  end
end
