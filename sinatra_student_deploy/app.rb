require 'sinatra/base'
require 'nokogiri'
require 'sqlite3'

require_relative './lib/concerns/persistable'

require_relative './lib/models/artist'
#require_relative './lib/models/student'
require_relative './lib/models/ooscrape'

module StudentSite
  class App < Sinatra::Base
    
    # get '/hello-world' do
    #   @random_numbers = (1..20)
    #   erb :hello
    # end

    # get '/hello-test' do    
    #   @random_numbers = (10..20)
    #   erb :hello
    # end

    # get '/artist' do
    #   a1 = Artist.new
    #   a1.name = "Pablo Picasso"
    #   a2 = Artist.new
    #   a2.name = "Leonardo Davinci"

    #   @artists = Artist.all
    #   erb :artists
    # end

    get '/' do
      @students = Student.all

      erb :'/students/students'
    end

    # Dynamic Routing

    get '/students/:int' do

      student_info = Student.find_by_id(params[:int])

      @name     = student_info[1]
      @bio      = student_info[7]
      @twitter  = student_info[3]
      @quote    = student_info[6]

      erb :'/students/profile'
    end

  end
end