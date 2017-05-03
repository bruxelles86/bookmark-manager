feature 'Displays bookmarks' do
  scenario 'Visiting home page displays links' do
    DatabaseCleaner.start
    Link.create(title: 'BBC', url: 'https://www.bbc.co.uk')
    visit ('/links')
    find_link('BBC').visible?
    DatabaseCleaner.clean
  end
end
