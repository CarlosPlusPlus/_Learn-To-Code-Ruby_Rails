require 'sinatra'
require 'json'
require "sinatra/activerecord"
require 'debugger'

set :database, "sqlite3:///ichat.db"

get '/' do
  @messages = Message.all
  erb :messages
end

get '/reset' do
   Message.delete_all
  "Messages reset!"
  sleep 3
  redirect '/'
end

post '/' do

  @sender   = params[:sender]
  @receiver = params[:receiver]
  @message  = params[:message]

  Message.create({:sender => @sender, :receiver => @receiver, :content => @message})

end

class Message < ActiveRecord::Base
  # TODO: Use this class as a table in the database
end