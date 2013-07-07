class Student < ActiveRecord::Base
  attr_accessible :bio, :github, :linkedin, :name, :quote, :tagline, :treehouse_profile, :twitter
end
