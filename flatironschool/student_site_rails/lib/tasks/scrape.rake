desc "Load student_scraper class."
task :load_scraper do
  require 'student_scrape'
end

desc "Perform initial seed of DB by scraping students."
task :seed_students => [:environment, :load_scraper] do
  scraped_students = StudentScrape.scrape_students.compact

  scraped_students.each do |s|
    Student.create(:name => s.name, :twitter => s.twitter, :linkedin => s.linkedin, :github => s.github, :quote => s.quote, :bio => s.bio)
  end
end