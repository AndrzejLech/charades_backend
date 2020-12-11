class CategoriesController < ApplicationController

  def index
    render json:  {
        messages: "Loaded categories",
        status: "SUCCESS",
        data: Category.order('id ASC')
    }, status: :ok
  end

  def show
    render json:  {
        messages: "Loaded category",
        status: "SUCCESS",
        data: Category.find(params[:id])
    }, status: :ok
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json:  {
          messages: "Created category",
          status: "SUCCESS",
          data: category
      }, status: :ok
    else
      render json:  {
          messages: "Category not created",
          status: "ERROR",
          data: category.errors
      }, status: :unprocessable_entity
    end
  end

  def update
    category = Category.find(params[:id])
    if category.update_attributes(category_params)
      render json:  {
          messages: "Updated category",
          status: "SUCCESS",
          data: category
      }, status: :ok
    else
      render json:  {
          messages: "Category not updated",
          status: "ERROR",
          data: category.errors
      }, status: :unprocessable_entity
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    render json:  {
        messages: "Deleted category",
        status: "SUCCESS",
        data: category
    }, status: :ok
  end

  private
  def category_params
    params.permit(:name, :user_id)
  end
end