require_relative '../database'

class User
  def self.create(username, password, email, phone_no)
  end

  def self.get_by_username(username)
    connection = Database.connect
  end
end
