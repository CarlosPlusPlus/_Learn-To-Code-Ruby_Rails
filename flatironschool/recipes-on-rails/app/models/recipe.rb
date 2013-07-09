class Recipe < ActiveRecord::Base
  attr_accessible :name, :ingredients_to_add
  has_many :ingredients

  def ingredients_to_add=(ingredients)
  	add_ingredients(ingredients)
  end

  def add_ingredients (ingredients)
  	ingredients.each do |i|
  		self.ingredients << Ingredient.new(:name => i)
  	end
  end

end
