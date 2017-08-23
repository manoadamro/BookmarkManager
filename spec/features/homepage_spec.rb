#
# require './app/models/bookmark'
#
# DatabaseCleaner.strategy = :truncation
#
# feature 'homepage' do
#   test_bookmark = nil
#
#   before do
#     DatabaseCleaner.start
#   end
#
#   after do
#     DatabaseCleaner.clean
#   end
#
#   scenario 'shows links' do
#     visit '/links'
#     test_bookmark = Bookmark.create(title: 'Google', link: 'www.google.com')
#     expect(page).to have_content('Google: www.google.com')
#   end
# end
