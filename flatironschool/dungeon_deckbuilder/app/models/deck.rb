class Deck < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :cards
end
