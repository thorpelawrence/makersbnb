feature 'homepage' do
  scenario 'should show homepage content' do
    visit('/')
    expect(page).to have_content('Makers BNB')
  end
end
