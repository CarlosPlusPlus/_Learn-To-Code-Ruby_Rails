class Zoo < ActiveRecord::Base
  attr_accessible :name
  has_many :animals, :dependent => :destroy
end
