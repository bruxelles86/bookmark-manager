feature 'Displays bookmarks' do
  scenario 'Visiting home page displays links' do
    visit ('/')
    find_link('Google').visible?
  end
end
