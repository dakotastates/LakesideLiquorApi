class Api::V1::RecipesController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :show, :update, :profile, :destroy]
    before_action :find_recipe, only:[:show, :update, :destroy]

    def index
           # if params[:user_id]
           #     @recipes = Recipe.where(user_id: params[:user_id])
           # else
           #     @recipes = Recipe.all
           # end

           # render json: RecipeSerializer.new(@recipes).serialized_json
           @recipes = Recipe.all
           render json: @recipes
       end

       def current_user_recipes
          if logged_in?
              @recipes = current_user.recipes
              render json: @recipes

          else
              render json: {
                  notice: "You don't have any recipes, yet."
              }
          end
      end

      def show
         # @recipe = Recipe.find_by(id: params[:id])
         render json: @recipe
     end

     def create
       # byebug
          # @recipe = current_user.recipes.build(recipe_params)
          @recipe = Recipe.create(recipe_params)

          # byebug
          if @recipe.save

              render json: { recipe: RecipeSerializer.new(@recipe)}, status: :created
          else

              render json: { error: @recipe.errors.full_messages }, status: :not_acceptable
          end
      end

      def update
          # @recipe = Recipe.find_by(id: params[:id])
          if @recipe.update(recipe_params)
              render json: @recipe
          else
              # error_resp = {
              #     error: @recipe.errors.full_messages.to_sentence,
              #     invalid_user: "You don't have access to this recipe!"
              # }
            render json: { error: @recipe.errors.full_messages }, status: :not_acceptable
          end
      end

      def destroy
        # byebug
        @recipe.destroy
        render json: { result: :ok }
      end



    private

    def recipe_params
      params.require(:recipe).permit( :id, :name, :author, :description, :source, :image_url, :instructions, :user_id)
    end

    def find_recipe
      @recipe = Recipe.find_by_id(params[:id])
    end


end
