class Recipe < ActiveRecord::Base
  attr_accessible :name, :ingredients, :ingredients_to_add

  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients

  def ingredients_to_add=(ingredients_names)
    ingredients_names.collect(&:strip).collect(&:downcase).reject(&:empty?).uniq.each do |ingredient_name|
      ingredient = Ingredient.where(name: ingredient_name).first_or_create
      self.recipe_ingredients.build(ingredient: ingredient)
    end
  end

end
