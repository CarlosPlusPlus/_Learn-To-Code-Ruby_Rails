class Student < ActiveRecord::Base
  attr_accessible :bio, :github, :linkedin, :name, :quote, :twitter, :education, :work
end
