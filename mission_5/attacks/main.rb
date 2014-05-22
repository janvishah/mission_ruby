require "csv"
require "./active_record/Base"
include ActiveRecord
require "./City"
require "./State"
require "./Country"

# Fetch all records.
puts Country.all.count == 2 # Returns array of all countries.
puts State.all.count == 4   # Returns array of all states.
puts City.all.count == 8    # Returns array of all cities.

country = Country.find_by name: 'india'
puts country.name == "india"
country = Country.find_by id: 2         # Country object.
puts country.name == "pakistan"
state = State.find_by name: 'gujarat'   # State object.
puts state.name == "gujarat"
state = State.find_by id: 2             # State object.
puts state.name == "maharashtra"
city = City.find_by name: 'bharuch'     # City object.
puts city.name == "bharuch"
city = City.find_by id: 4               # City object.
puts city.name == "pune"