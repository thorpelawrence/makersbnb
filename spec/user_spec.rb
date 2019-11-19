require "user"

describe User do
  it "should create a user" do
    User.create("test_username", "test_password", "test@test.com", "01234567890")
    expect(User.get_by_username("test_username")).not_to be_nil
  end

  it "should check if the password is correct" do
    User.create("test_username", "test_password", "test@test.com", "01234567890")
    user = User.get_by_username("test_username")
    p user
    expect(user["username"].length).to eq 61
  end
end
