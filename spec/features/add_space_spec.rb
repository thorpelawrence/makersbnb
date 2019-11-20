require_relative "../login_helper"

feature "FEATURE: Adding new property" do
  scenario "user is able to add a new property" do
    sign_up
    log_in
    visit "/profile"
    expect(page).to have_link("Add new property")
  end

  scenario "when user is not signed in Add new property button should not be available" do
    visit "/profile"
    expect(page).not_to have_link("Add new property")
  end

  scenario "user can add new property" do
    sign_up
    log_in
    visit "/add-space"
    fill_in "property-name", :with => "Bramleys End"
    select "Apartment", :from => "home-type"
    fill_in "location", :with => "Peterborough"
    select "Private room", :from => "room-type"
    fill_in "accomodates", :with => "2"
    fill_in "beds", :with => "2"
    fill_in "price", :with => "40"
    fill_in "date-from", :with => "2019-12-01"
    fill_in "date-to", :with => "2019-12-14"
    check("wifi")
    check("kitchen")
    check("parking")
    check("heating")
    fill_in "property-img", :with => "https://dummyimage.com/600x400/000/fff"
    click_on "Continue"
    expect(page).to have_content "Bramleys End"
  end
end
