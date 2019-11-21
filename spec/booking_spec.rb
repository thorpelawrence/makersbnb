require 'booking'
require 'pg'

describe Booking do
    it 'creates an instance of the booking class' do
        expect(subject).to be_an_instance_of(Booking)
    end

    
end