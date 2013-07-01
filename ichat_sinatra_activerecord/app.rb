require 'sinatra'
require 'json'
require "sinatra/activerecord"


set :database, "sqlite3:///ichat.db"


get '/' do
  @messages = Message.all
  erb :messages
end

get '/reset' do
   # Reset the messages
  "Messages reset!"
end

post '/' do
  # TODO: Read the message contents, save to the database

end

class Message < ActiveRecord::Base

  # TODO: Use this class as a table in the database

end