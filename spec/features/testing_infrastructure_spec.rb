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

feature 'Filters by tags' do
  scenario 'checks articles with \'bubbles\' tag appear on /tags/bubbles' do
    DatabaseCleaner.start
    Link.create(title: 'Bubbles', url: 'www.bubbles.com', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(title: 'BBC', url: 'https://www.bbc.co.uk', tags: [Tag.first_or_create(name: 'news')])
    visit ('/tags/bubbles')
    expect(page).to have_content ('Bubbles')
    expect(page).not_to have_content ('BBC')
    DatabaseCleaner.clean
  end
end

feature 'Allows multiple tags to be assigned' do
  scenario 'user adds two tags to new URL, which then appears on the screen with both tags' do
    DatabaseCleaner.start
    visit('/links/new')
    fill_in 'title', with: 'Makers Academy'
    fill_in 'url', with: 'http://makersacademy.com'
    fill_in 'tags', with: 'education, IT'
    click_button 'Save!'
    link = Link.first
    save_and_open_page
    expect(link.tags.map{ |tag| tag.name }).to include ('education')
    expect(link.tags.map{ |tag| tag.name }).to include ('IT')
    DatabaseCleaner.clean
  end
end
