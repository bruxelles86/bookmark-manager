feature 'Creates bookmarks' do
  scenario 'adds a link to database' do
    visit('/links/new')
    fill_in 'title', with: 'Makers Academy'
    fill_in 'url', with: 'http://makersacademy.com'
    click_button 'Save!'
    find_link('Makers Academy').visible?
  end
end
