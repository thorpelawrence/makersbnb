require 'pg'

class Booking 
    def self.create(listing_id, guest_username, date_from, date_to)
        connection = Database.connect
        connection.exec_params("INSERT INTO booking (listing_id, guest_username, date_from, date_to) VALUES ($1, $2, $3, $4)",
                               [listing_id, guest_username, date_from, date_to])
    end

    def self.get_booking_by_guest_username(username)
        connection = Database.connect
        booking = connection.exec_params("SELECT * FROM booking WHERE guest_username=$1", [username]).first
    end
end