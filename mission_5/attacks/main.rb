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
