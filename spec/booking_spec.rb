require 'booking'
require 'property'
require 'user'
require 'pg'

describe Booking do
    it 'creates an instance of the booking class' do
        expect(subject).to be_an_instance_of(Booking)
    end

    it "should create a booking" do
        User.create("test_username", "test_password", "a@a.com", "01234567890")
        new_prop = Property.create("house", "London", "double", "4", "200", "2019-12-01", "2019-12-07", "Buck House",
                    "2", "TRUE", "TRUE", "TRUE", "TRUE", "NULL", "test_username").first
        Booking.create(new_prop['id'], "test_username", "2019-12-02", "2019-12-03")
        expect(Booking.get_booking_by_guest_username("test_username")).not_to be_empty
      end

    it "should be able to approve a booking" do
        User.create("test_username", "test_password", "a@a.com", "01234567890")
        new_prop = Property.create("house", "London", "double", "4", "200", "2019-12-01", "2019-12-07", "Buck House",
                    "2", "TRUE", "TRUE", "TRUE", "TRUE", "NULL", "test_username").first
        new_booking = Booking.create(new_prop['id'], "test_username", "2019-12-02", "2019-12-03")

        approved_booking = Booking.approve_booking('test_username', new_prop['id'], true)
        expect(approved_booking['approved']).to eq 't'
    end

    it "should be able to decline a booking" do
        User.create("test_username", "test_password", "a@a.com", "01234567890")
        new_prop = Property.create("house", "London", "double", "4", "200", "2019-12-01", "2019-12-07", "Buck House",
                    "2", "TRUE", "TRUE", "TRUE", "TRUE", "NULL", "test_username").first
        new_booking = Booking.create(new_prop['id'], "test_username", "2019-12-02", "2019-12-03")

        approved_booking = Booking.approve_booking('test_username', new_prop['id'], false)
        
        expect(Booking.get_booking_by_guest_username("test_username")).to be_empty
    end
end
