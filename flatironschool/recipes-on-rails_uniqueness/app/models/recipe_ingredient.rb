class RecipeIngredient < ActiveRecord::Base
  attr_accessible :ingredient_id, :recipe_id, :ingredient, :recipe

  belongs_to :recipe
  belongs_to :ingredient
end
