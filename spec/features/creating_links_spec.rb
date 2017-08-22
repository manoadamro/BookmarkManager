require './app/models/bookmark'

feature 'homepage' do

  scenario 'shows links' do
    visit '/links'
    click_button('Add link')
    fill_in :title, with: "Twitter"
    fill_in :link, with: "www.twitter.com"
    click_button('Submit')
    expect(page).to have_content('Twitter: www.twitter.com')
  end
end
