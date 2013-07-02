#require File.join(File.dirname(__FILE__), 'app.rb')

require 'bundler/setup'
require 'sinatra'
require 'data_mapper'
require 'dm-sqlite-adapter'
require 'open-uri'
require 'json'

require './environment'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/source/stations.db")

citibike_parser = StationParser.new('http://citibikenyc.com/stations/json')
citibike_parser.call

# parser = LibraryParser.new('/Users/avi/Development/code/playlister-rb/data')
# parser.call

require './app'

run Citibike::App.new

