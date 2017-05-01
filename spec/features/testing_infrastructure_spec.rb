feature 'Displays bookmarks' do
  before do
    DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, "postgres://localhost/bookmarks")
    DataMapper.finalize.auto_upgrade!
  end

  scenario 'Visiting home page displays links' do
    Link.create(address: 'https://www.google.co.uk')
    visit ('/')
    find_link('Google').visible?
  end
end
