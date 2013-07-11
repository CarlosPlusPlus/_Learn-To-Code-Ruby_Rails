class Recipe < ActiveRecord::Base
  attr_accessible :name, :ingredients_to_add

  has_many :ingredients
  
  validates_presence_of :name

  def ingredients_to_add=(ingredients)
    ingredients.each do |ingredient|
      self.ingredients.build(:name => ingredient)
    end
  end

  def ingredients_to_add
    ""
  end
end
