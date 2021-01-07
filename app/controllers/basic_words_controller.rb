class BasicWordsController < ApplicationController
 def index
    @basic_word = BasicWord.order('id')
    render json: {status: 'Succes',
                  message: 'loaded all basic words',
                  data: @basic_word},
           status: :ok
  end

  def show
    render json: {
        messages: "Loaded word",
        status: "SUCCESS",
        data: BasicWord.find(params[:id])},
           status: :ok
  end
end