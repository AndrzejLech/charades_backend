class WordsController < ApplicationController
  before_action :get_user
  before_action :get_category
  before_action :set_word, only: [:show, :destroy]

  def index
    @words = @category.words
    render json:  {
        messages: "Loaded words",
        status: "SUCCESS",
        data: @words,
    }, status: :ok
  end

  def show
    @word = @category.words.find(params[:category_id])
    render json:  {
        messages: "Loaded word",
        status: "SUCCESS",
        data: @word
    }, status: :ok
  end

  def create
    @word = @category.words.build(word_params)
    if @word.save
      render json:  {
          messages: "Created word",
          status: "SUCCESS",
          data: @word
      }, status: :ok
    else
      render json:  {
          messages: "Word not created",
          status: "ERROR",
          data: @word.errors
      }, status: :unprocessable_entity
    end
  end

  def update
    @word = @category.words.find(params[:id])
    if @word.update_attributes(word_params)
      render json:  {
          messages: "Updated word",
          status: "SUCCESS",
          data: @word
      }, status: :ok
    else
      render json:  {
          messages: "Word not updated",
          status: "ERROR",
          data: word.errors
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @word = @category.words.find(params[:id])
    @word.destroy
    render json:  {
        messages: "Deleted word",
        status: "SUCCESS",
        data: @word
    }, status: :ok
  end

  private def get_user
    @user = User.find(params[:user_id])
  end

  private def get_category
    @category = @user.categories.find(params[:category_id])
  end

  private def set_word
    @word = @category.words.find(params[:id])
  end

  private
  def word_params
    params.permit(:word, :category_id, :user_id)
  end
end