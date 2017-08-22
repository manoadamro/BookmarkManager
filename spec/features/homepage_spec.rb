require './app/models/bookmark'

feature "homepage" do
  scenario "shows links" do
    Bookmark.create(title: "Google", link: "www.google.com")
    visit '/links'
    expect(page).to have_content("Google www.google.com")
  end
end
