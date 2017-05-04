feature 'Displays bookmarks' do
  scenario 'Visiting home page displays links' do
    DatabaseCleaner.start
    Link.create(title: 'BBC', url: 'https://www.bbc.co.uk')
    visit ('/links')
    find_link('BBC').visible?
    DatabaseCleaner.clean
  end
end

feature 'Tags bookmarks' do
  scenario 'Adds a tag to a new bookmark upon creation' do
    DatabaseCleaner.start
    visit('/links/new')
    fill_in 'title', with: 'Makers Academy'
    fill_in 'url', with: 'http://makersacademy.com'
    fill_in 'tags', with: 'education'
    click_button 'Save!'
    link = Link.first
    expect(link.tags.map(&:name)).to include ('education')
    DatabaseCleaner.clean
  end
end
