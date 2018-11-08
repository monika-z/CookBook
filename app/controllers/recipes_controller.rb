class RecipesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
    before_action :set_categories, only: [:new, :edit, :update, :create]
    
    def index
        @recipes = Recipe.paginate(:page => params[:page], :per_page => 2)
    end
    
    def show
        @recipe = Recipe.find(params[:id])
    end
    
    def new
        @recipe = Recipe.new
    end   
    
    def edit
        @recipe = Recipe.find(params[:id])
    end
    
    def create
        @recipe = Recipe.new(recipe_params)

        if @recipe.save
            redirect_to @recipe
        else
            render 'new'
        end    
    end
    
    def update
        @recipe = Recipe.find(params[:id])
 
        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            render 'edit'
        end
    end
    
    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
 
        redirect_to recipes_path
    end
    
    private
        def recipe_params
            params.require(:recipe).permit(:title, :text, {:category_ids => []}).merge(user_id: current_user.id)
        end    
        
        def set_categories
            @categories = Category.all.map do |category|
            [ category.name, category.id]
        end
end
    
end