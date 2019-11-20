require 'property'

describe Property do
  it 'should create a property' do

   Property.create("house", "London", "double", "4", "200", "2019-12-01", "2019-12-07", "Buck House",
    "2", "TRUE", "TRUE", "TRUE", "TRUE", "NULL" )
    properties = Property.all
    areas = properties.map do |property|
        property["area"]
    end
 expect(areas).to include( "London")
  end
end