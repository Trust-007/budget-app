class CategoriesController < ApplicationController
   before_action :authenticate_user!

   def index
    @user =  User.includes(:categories).find(current_user.id)
   end

   def new
     @category = Category.new
   end

   def create
     @category = Category.new(categories_params)
     if @category.save
        redirect_to categories_path
     else
        render 'new'
     end
   end

   private

   def categories_params
     params.require(:category).permit(:name, :icon).merge(user: current_user)
   end
end