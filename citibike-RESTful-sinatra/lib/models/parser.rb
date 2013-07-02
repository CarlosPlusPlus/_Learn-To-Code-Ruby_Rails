puts "PARSER is loaded from: #{File.dirname(__FILE__)}"

require 'pp'

class Parser
  def initialize(json_loc)
    puts "I'm in the PARSER initialize method!"
    @json_loc = json_loc
  end

  def call
    DataMapper.auto_migrate!

    station_data = JSON.parse(open(@json_loc).read)
    station_data["stationBeanList"].each do |station|
      Station.create(station)
    end
  end

end