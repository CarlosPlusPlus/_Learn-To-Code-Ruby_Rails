class RecipeIngredient < ActiveRecord::Base
  attr_accessible :ingredient_id, :recipe_id, :ingredient, :recipe
  # so, can't do multiple belong tos on one line?
  belongs_to :recipe
  belongs_to :ingredient
end
