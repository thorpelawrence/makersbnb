require_relative "../login_helper"

feature "FEATURE: Adding new property" do
  scenario "user can add new property" do
    sign_up
    log_in
    visit '/add_space'
    fill_in 'home_type', :with => 'Appartment'
    fill_in 'area', :with => 'Peterborough'
    fill_in 'room-type', :with => 'Private Room'
    fill_in 'price', :with => '£40'
    fill_in 'date_from', :with => '2019-12-01'
    fill_in 'date_to', :with => '2019-12-14'
    fill_in 'property_name', :with => 'Bramleys End'
    fill_in 'wifi', :with => 'TRUE'
    fill_in 'parking', :with => 'TRUE'
    fill_in 'kitchen', :with => 'TRUE'
    fill_in 'heating', :with => 'TRUE'
    fill_in 'image_link', :with => 'NULL'
    find('input[type="submit"]').click
    expect(page).to contain("Bramleys End")
  end
end
