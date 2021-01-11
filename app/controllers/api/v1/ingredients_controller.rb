class Api::V1::IngredientsController < ApplicationController
  skip_before_action :authorized, only: [:create, :show, :update, :profile]
  before_action :find_ingredient, only:[:show, :update, :destroy]

  def index
    @ingredients = Ingredient.where(recipe_id: params[:recipe_id])
    render json: @ingredients), status: :ok
  end

  def show
    # @ingredient = find_by(id: params[:id])
    render json: @ingredient, status: :ok
  end

  def create
    if params[:recipe_id]
        @recipe = Recipe.find_by(recipe_id: params[:recipe_id])
        @ingredient = @recipe.ingredients.build(ingredient_params)
        if @ingredient.save
            render json: @ingredient, status: :ok
        else
            error_resp = {
                error: @ingredient.errors.full_messages.to_sentence
            }
            render json: error_resp, status: :unprocessable_entity
        end
    end

  end

  def update
      
      if @ingredient.update(ingredient_params)
          render json: @ingredient
      else
          error_resp = {
              error: @ingredient.errors.full_messages.to_sentence,
              invalid_user: "You don't have access to this ingredient!"
          }
          render json: error_resp, status: :unprocessable_entity
      end
  end

  def destroy
    @ingredient.destroy
    render json: { result: :ok }
  end


  private

  def recipe_params
    params.require(:ingredient).permit( :id, :name, :quantity, :unit, :recipe_id)
  end

  def find_ingredient
    @ingredient = Ingredient.find_by_id(params[:id])
  end
end
