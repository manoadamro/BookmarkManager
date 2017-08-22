require './app/models/bookmark'

feature 'homepage' do
  test_bookmark = nil

  before do
    test_bookmark = Bookmark.create(title: 'Google', link: 'www.google.com')
  end

  after do
    test_bookmark.destroy
  end

  scenario 'shows links' do
    visit '/links'
    expect(page).to have_content('Google: www.google.com')
  end
end
