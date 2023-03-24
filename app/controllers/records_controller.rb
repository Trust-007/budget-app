class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    category = Category.includes(:records).find(params[:category_id])
    @records = category.records.order(created_at: :desc)
  end

  def new
    @record = Record.new
    @category = Category.find(params[:category_id])
    @categories = current_user.categories
  end

  def create
    @category = Category.find(params[:category_id])
    @categories = current_user.categories
    params = records_params
    @record = Record.new(name: params[:name], amount: params[:amount])
    @record.user = current_user
    @categories_ids = params[:category_ids]
    @categories_ids.each do |id|
      category = Category.find(id) unless id == ''
      @record.categories << category unless category.nil?
    end
    if @record.save
      redirect_to category_records_path(@record.categories.first.id)
    else
      render 'new'
    end
  end

  private

  def records_params
    params.require(:record).permit(:name, :amount, category_ids: [])
  end
end
