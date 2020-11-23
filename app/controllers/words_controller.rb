class WordsController < ApplicationController
  def index
    render json:  {
        messages: "Loaded words",
        status: "SUCCESS",
        data: Word.order('id ASC')
    }, status: :ok
  end

  def show
    render json:  {
        messages: "Loaded word",
        status: "SUCCESS",
        data: Word.find(params[:id])
    }, status: :ok
  end

  def create
    word = Word.new(word_params)
    if word.save
      render json:  {
          messages: "Created word",
          status: "SUCCESS",
          data: word
      }, status: :ok
    else
      render json:  {
          messages: "Word not created",
          status: "ERROR",
          data: word.errors
      }, status: :unprocessable_entity
    end
  end

  def update
    word = Word.find(params[:id])
    if word.update_attributes(word_params)
      render json:  {
          messages: "Updated word",
          status: "SUCCESS",
          data: word
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
    word = Word.find(params[:id])
    word.destroy
    render json:  {
        messages: "Deleted word",
        status: "SUCCESS",
        data: word
    }, status: :ok
  end

  private
  def word_params
    params.permit(:word, :category_id)
  end
end