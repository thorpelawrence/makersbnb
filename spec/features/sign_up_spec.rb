feature "FEATURE: Signing up" do
  scenario "user can sign up" do
    sign_up
    expect(User.get_by_username("test_username")).not_to be_nil
  end

  scenario "user cant sign up with existing email or username" do
    sign_up
    sign_up
    expect(page).to have_content("Username is already taken. Email is already taken.")
  end

  scenario "user cant sign up with non-matching passwords" do
    sign_up
    expect { incorrect_sign_up }.not_to change { User.count }
  end
end
