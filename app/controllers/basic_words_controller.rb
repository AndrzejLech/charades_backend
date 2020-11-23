class BasicWordsController < ApplicationController
  def show
    render json:  {
        messages: "Loaded word",
        status: "SUCCESS",
        data: BasicWord.find(params[:id])
    }, status: :ok
  end
end