require "#{Rails.root}/lib/student_scrape.rb"

scraped_students = StudentScrape.scrape_students.compact

  scraped_students.each do |s|
    Student.create(:name => s.name, :twitter => s.twitter, :linkedin => s.linkedin, :github => s.github, :quote => s.quote, :bio => s.bio, :education => s.education, :work => s.work)
  end