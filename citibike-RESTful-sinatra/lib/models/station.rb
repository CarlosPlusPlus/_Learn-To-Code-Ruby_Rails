class Station
  include DataMapper::Resource 
  
  property :id, Serial
  property :stationName, Text
  property :availableDocks, Integer
  property :totalDocks, Integer
  property :latitude, Float
  property :longitude, Float
  property :statusValue, Text
  property :statusKey, Integer
  property :availableBikes, Integer 
  property :stAddress1, Text
  property :stAddress2, Text
  property :city, Text
  property :postalCode, Text 
  property :location, Text
  property :altitude, Float
  property :testStation, Text
  property :lastCommunicationTime, DateTime
  property :landMark, Text

end

