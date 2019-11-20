require_relative "../database"
# require_relative "lib/user"

class Property
  def self.create(home_type, area, room_type, max_people, price,
                  date_from, date_to, property_name, no_beds, wifi, parking, kitchen, heating, image_link, username)
    connection = Database.connect
    connection.exec_params("INSERT INTO listings (home_type, area, room_type, max_people, price,
        date_from, date_to, property_name, no_beds, wifi, parking, kitchen, heating, image_link, username) 
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)", [home_type, area, room_type, max_people, price,
                                                                                     date_from, date_to, property_name, no_beds, wifi, parking, kitchen, heating, image_link, username])
  end

  def self.all
    connection = Database.connect
    connection.exec("SELECT * FROM listings").to_a
  end
end
