puts "CONFIG is loaded from: #{File.dirname(__FILE__)}"

require './app'

citibike_parser = Parser.new('http://citibikenyc.com/stations/json')
citibike_parser.call

run Citibike::App