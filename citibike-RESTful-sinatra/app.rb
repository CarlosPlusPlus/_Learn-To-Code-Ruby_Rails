puts "APP is loaded from: #{File.dirname(__FILE__)}"

require 'rubygems'
require 'sinatra'

require 'data_mapper'
require 'dm-sqlite-adapter'
require 'json'
require 'open-uri'

require './environment'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/stations.db")

module Citibike
	class App < Sinatra::Application
  
    # ROUTES GO HERE

    helpers do
      def partial(view)
        erb view, :layout => false
      end
    end

    DataMapper.auto_upgrade!

  end
end