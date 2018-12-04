require('pry')
require_relative('./models/property_list')



property1 = PropertyListing.new ({      #each of these is a different object/house
  'address' => '8 Blue Street',
  'value' => '250000',
  'rental_status' => 'available',
  'year_built' => '1950'
  })

property2 = PropertyListing.new ({
  'address' => '6 Purple Road',
  'value' => '100000',
  'rental_status' => 'sold',
  'year_built' => '1801'
  })


property1.save  #this is the function that ACTUALLY saves in the database or calls the function
property2.save
properties_array = PropertyListing.all()

binding.pry
nil   #need this for binding.pry to run 
