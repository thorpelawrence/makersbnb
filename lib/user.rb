require_relative "../database"
require "bcrypt"

class User
  def self.create(username, password, email, phone_no)
    connection = Database.connect
    result = connection.exec_params("INSERT INTO users (username, pass, email, phone_number) VALUES ($1, $2, $3, $4)",
                           [username, BCrypt::Password.create(password), email, phone_no])
    connection.close
    result
  end

  def self.get_by_username(username)
    connection = Database.connect
    user = connection.exec_params("SELECT * FROM users WHERE username=$1", [username]).first
    connection.close
    user
  end

  def self.check_password(username, password)
    connection = Database.connect
    user = connection.exec_params("SELECT * FROM users WHERE username=$1", [username]).first
    connection.close
    return false if user.nil?
    return BCrypt::Password.new(user["pass"]) == password
  end
end
