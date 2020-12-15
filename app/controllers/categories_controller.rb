class CategoriesController < ApplicationController
  before_action :get_user
  before_action :set_category, only:  [:show, :destroy]

  def index
    @categories = @user.categories
    render json: {
        messages: "Loaded categories",
        status: "SUCCESS",
        data: @categories
    }, status: :ok
  end

  def show
    @category = @user.categories.find([:id])
    render json: {
        messages: "Loaded category",
        status: "SUCCESS",
        data: @category
    }, status: :ok
  end

  def create
    @category = @user.categories.build(category_params)
    if @category.save
      render json: {
          messages: "Created category",
          status: "SUCCESS",
          data: @category
      }, status: :ok
    else
      render json: {
          messages: "Category not created",
          status: "ERROR",
          data: @category.errors
      }, status: :unprocessable_entity
    end
  end

  def update
    @category = @user.categories.find(params[:id])
    if @category.update_attributes(category_params)
      render json: {
          messages: "Updated category",
          status: "SUCCESS",
          data: @category
      }, status: :ok
    else
      render json: {
          messages: "Category not updated",
          status: "ERROR",
          data: @category.errors
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @category = @user.categories.find(params[:id])
    @category.destroy
    render json: {
        messages: "Deleted category",
        status: "SUCCESS",
        data: @category
    }, status: :ok
  end

  private def get_user
    @user = User.find(params[:user_id])
  end

  private def set_category
    @category = @user.categories.find(params[:id])
  end

  private def category_params
    params.permit(:name, :user_id)
  end
end