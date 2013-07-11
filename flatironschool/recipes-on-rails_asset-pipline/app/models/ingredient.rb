class Ingredient < ActiveRecord::Base
  attr_accessible :name, :recipe_id

  validates :name, :presence => true
  validates :name, :length => {:within => 2..100}
end
