class RecipesController < ApplicationController

	def new
    @recipe = Recipe.new
    3.times do 
      @recipe.ingredients.build
    end
	end

	def show
		@recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end
  
end
