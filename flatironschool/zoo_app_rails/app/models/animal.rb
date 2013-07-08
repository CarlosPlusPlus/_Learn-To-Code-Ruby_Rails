class Animal < ActiveRecord::Base
  attr_accessible :count, :species, :zoo_id
  belongs_to :zoo
  validates_existence_of :zoo
end
