class RecordsController < ApplicationController
   
   def index
    @category =  Category.includes(:records).find(params[:category_id])
    @records = @category.records.order(created_at: :desc)
    @categories = Category.all
   end

   def new
     @record = Record.new
   end

   def create
     @record = Record.new(records_params)
     if @record.save
        redirect_to category_path
     else
        render 'new'
     end
   end

   private

   def records_params
     params.require(:records).permit(:name, :amount).merge(user: current_user)
   end
end