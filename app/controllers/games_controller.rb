class GamesController < ApplicationController
    before_action :get_user
    before_action :set_games, only:  [:show, :destroy]

    def index
      @game = @user.games
      render json: {
          messages: "Loaded game",
          status: "SUCCESS",
          data: @game,
      }, status: :ok
    end

    def show
      @game = @user.games.find(params[:id])
      render json: {
          messages: "Loaded game",
          status: "SUCCESS",
          data: @game
      }, status: :ok
    end

    def create
      @game = @user.games.build(game_params)
      if @game.save
        render json: {
            messages: "Created game",
            status: "SUCCESS",
            data: @game
        }, status: :ok
      else
        render json: {
            messages: "Game not created",
            status: "ERROR",
            data: @game.errors
        }, status: :unprocessable_entity
      end
    end

    def update
      @game = @user.games.find(params[:id])
      if @game.update_attributes(game_params)
        render json: {
            messages: "Updated game",
            status: "SUCCESS",
            data: @game
        }, status: :ok
      else
        render json: {
            messages: "Game not updated",
            status: "ERROR",
            data: @game.errors
        }, status: :unprocessable_entity
      end
    end

    def destroy
      @game = @user.games.find(params[:id])
      @game.destroy
      render json: {
          messages: "Deleted game",
          status: "SUCCESS",
          data: @game
      }, status: :ok
    end

    private def get_user
      @user = User.find(params[:user_id])
    end

    private def set_games
      @game = @user.games.find(params[:id])
    end

    private def game_params
      params.permit( :user_id)
    end
end