feature 'Displays bookmarks' do
  before do
    DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, "postgres://localhost/bookmarkmanager")
    DataMapper.finalize.auto_upgrade!
  end

  scenario 'Visiting home page displays links' do
    Link.create(title: 'BBC', url: 'https://www.bbc.co.uk')
    visit ('/links')
    find_link('BBC').visible?
  end
end
