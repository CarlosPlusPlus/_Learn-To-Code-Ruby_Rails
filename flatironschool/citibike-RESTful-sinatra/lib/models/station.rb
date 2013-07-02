puts "STATION is loaded from: #{File.dirname(__FILE__)}"

class Station
  include DataMapper::Resource 

  property :id, Serial
  property :stationName, Text
  property :availableDocks, Integer
  property :totalDocks, Integer
  property :latitude, Float
  property :longitude, Float
  property :statusValue, String
  property :statusKey, Integer
  property :availableBikes, Integer
  property :stAddress1, String
  property :stAddress2, String
  property :city, String
  property :postalCode, String
  property :location, String
  property :altitude, String
  property :testStation, Boolean
  property :lastCommunicationTime, DateTime
  property :landMark, String
end