require 'rubygems'
require 'bundler'

Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Citibike
	class App < Sinatra::Application
  #   before do
  #     json = File.open("data/citibikenyc.json").read
  #     @data = MultiJson.load(json)
  #   end

  #   get '/' do
  #     erb :home
  #   end

  #   get '/form' do
  #     erb :form
  #   end

  #   post '/form' do
  #     @start = params["start"]
  #     @end   = params["end"]

  #     "You chose #{@start} and #{@end}!"
  #   end

  #   post '/map' do
  #     @start = params["start"]
  #     @end   = params["end"]

  #     erb :map
  #   end

  # end
end