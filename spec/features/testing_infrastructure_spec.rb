feature 'Displays bookmarks' do
  scenario 'Visiting home page displays links' do
    Link.create(title: 'BBC', url: 'https://www.bbc.co.uk')
    visit ('/links')
    find_link('BBC').visible?
  end
end
