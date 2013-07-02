require 'bundler/setup'
require 'sinatra'
require 'data_mapper'
require 'dm-sqlite-adapter'

require './environment'

# parser = BikeParser.new('data/citibikenyc.json')
# parser.call

# parser = LibraryParser.new('/Users/avi/Development/code/playlister-rb/data')
# parser.call

require './app'

run Citibike::App.new