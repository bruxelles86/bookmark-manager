feature 'Creates bookmarks' do
  scenario 'adds a link to database' do
    DatabaseCleaner.start
    visit('/links/new')
    fill_in 'title', with: 'jimbob.com'
    fill_in 'url', with: 'http://jimbob.com'
    click_button 'Save!'
    find_link('jimbob.com').visible?
    DatabaseCleaner.clean
  end
end
