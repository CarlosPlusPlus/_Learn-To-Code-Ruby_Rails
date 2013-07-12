class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
  def create
    @recipe = Recipe.create(params[:recipe])
    redirect_to @recipe
  end
  def show
    @recipe = Recipe.find(params[:id])
  end
end
