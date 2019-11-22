require "pg"

class Booking
  def self.create(listing_id, guest_username, date_from, date_to)
    connection = Database.connect
    connection.exec_params("INSERT INTO booking (listing_id, guest_username, date_from, date_to) VALUES ($1, $2, $3, $4)",
                           [listing_id, guest_username, date_from, date_to])
  end
 
    def self.get_booking_by_guest_username(username)
        connection = Database.connect
        booking = connection.exec_params("SELECT * FROM booking b INNER JOIN listings l ON b.listing_id = l.id WHERE guest_username=$1", [username]).to_a
    end


  def self.approve_booking(guest_username, listing_id, approved)
    connection = Database.connect
    if approved
      booking = connection.exec_params("UPDATE booking SET approved = true WHERE guest_username = $1 AND listing_id=$2 RETURNING approved", [guest_username, listing_id]).first
    else
      booking = connection.exec_params("DELETE FROM booking WHERE guest_username = $1 AND listing_id = $2", [guest_username, listing_id])
    end
  end

  def self.all_for_username(username)
    connection = Database.connect
    connection.exec_params("SELECT * FROM booking WHERE listing_id IN (SELECT id FROM listings WHERE username=$1)", [username])
  end
end
