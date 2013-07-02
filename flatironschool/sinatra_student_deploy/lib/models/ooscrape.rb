# Database
 
# I'm going to scrape the student website and insert each student into the database
 
# Student
  #=> Attributes
  #=> "Some sort of interaction with the DB"
 
# Database #=> SQLite::Database

require 'open-uri'
require 'nokogiri'
require 'sqlite3'

require 'pp'

class StudentScrape
  attr_accessor :url
 
  def initialize(url)
    @url = url
    @doc = Nokogiri::HTML(open(url))
  end
 
 
  def bio
    @doc.search('p').first.text.strip
  end
 
  def quote
    @doc.search('h3').first.text.strip
  end
 
  def name
    @doc.search('h4').first.text.strip
  end
 
  def profile_urls
    profile_array = []
    @doc.search(".social-icons a").each do |item,index|
      profile_array << item.values[0]
    end
    profile_array
  end
 
  def github
    profile_urls.last
  end
 
  def linkedin
    profile_urls[1]
  end
 
  def twitter
    profile_urls.first
  end
end
 
class Student
  attr_accessor :id, :url, :name, :quote, :bio, :twitter, :github, :linkedin
 
  DB = SQLite3::Database.new("flatiron_students.db")
 
  def self.create_schema
    # Create a database
    DB.execute <<-SQL
      create table if not exists students (
        id INTEGER PRIMARY KEY,
        name varchar(35),
        url varchar(255),
        twitter varchar(255),
        linkedin varchar(255),
        github varchar(255),
        quote text,
        bio text
      );
    SQL
  end
  create_schema
 
  def scrape
    @student_scrape = StudentScrape.new(url)
    self.name = @student_scrape.name
    self.quote = @student_scrape.quote
    self.bio = @student_scrape.bio
    self.twitter = @student_scrape.twitter
  end
 
  def save
    puts "...inserting #{self.name} into the db"
    DB.execute("INSERT INTO students (name, url, twitter, linkedin, github, quote, bio)
           VALUES (?, ?, ?, ?, ?, ?, ?)",
      [
        self.name,
        self.url,
        self.twitter,
        self.linkedin,
        self.github,
        self.quote,
        self.bio
      ]
    )
  end

  def self.all
    DB.execute("SELECT name FROM students").flatten
  end

  def self.find_by_id(id)
    DB.execute("SELECT * FROM students WHERE id = #{id}").flatten
  end
end
 
index_doc = Nokogiri::HTML(open("http://students.flatironschool.com"))
 
# grab students urls and return array with urls
def student_urls(doc)
   url_array = []
   doc.search("h3 a").each do |item|
      unless item.values[0] == "#"
         url_array << "http://students.flatironschool.com/" + "#{item.values[0].downcase}"
         puts "http://students.flatironschool.com/" + "#{item.values[0].downcase}"
      end
   end
   url_array
end

# student_urls(index_doc).each do |url|
#   s = Student.new
#   s.url = url
#   s.scrape
#   s.save
# end