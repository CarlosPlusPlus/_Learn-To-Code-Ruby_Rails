require 'open-uri'
require 'nokogiri'

class StudentScrape
  attr_reader :doc

  def initialize(profile_url)
    @profile_url = profile_url
  end

  def image
    # doc = Nokogiri::HTML(open('http://students.flatironschool.com'))
    # search = doc.search('.home-blog-post')
    # serch.each do |result|
    #   result.attr('src')
    # end
  end

  def doc
    @doc ||= Nokogiri::HTML((open(@profile_url)))
  end

  def name
    self.doc.search('div.page-title h4.ib_main_header').text.strip
  end

  def twitter
    self.doc.search('div.social-icons a').first.attr('href').strip
  end

  def linkedin
    self.doc.search('div.social-icons a')[1].attr('href').strip
  end

  def github
    self.doc.search('div.social-icons a')[2].attr('href').strip
  end

  def quote
    self.doc.search('li#text-7 div.textwidget h3').text.strip
  end

  def bio
    self.doc.search('#equalize #ok-text-column-2 .services p').text.strip
  end

  def self.student_urls
    doc = Nokogiri::HTML(open('http://students.flatironschool.com'))
    url_search = doc.search('.blog-title .big-comment h3')
    url_search.collect do |i|
      if i.children.attr("href")
        "http://students.flatironschool.com/" + i.children.attr("href").value.downcase
      else
         '#'
      end
    end
  end

  def self.scrape_students
    self.student_urls.collect do |url|
      begin
        student_index = student_urls.index(url)
        if url != 'http://students.flatironschool.com/#' && url != '#'
          puts url
          StudentScrape.new(url)
        end
      rescue => e
        puts "Error: #{e}"
        next
      end
    end
  end

end