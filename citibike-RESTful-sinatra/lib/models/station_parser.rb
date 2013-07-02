require 'pp'
require_relative 'station'

class StationParser
  def initialize(json_loc)
    @json_loc = json_loc
  end

  def call
    station_data = JSON.parse(open(@json_loc).read)
    station_data["stationBeanList"].each do |station|
      pp station
      
      station_sym = Hash.new
      station.each do |k, v|
        station_sym[k.to_sym] = v
      end
      
      pp station_sym
      # Station.create(station_sym)
    end
  end

end