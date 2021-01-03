class PlayersController < ApplicationController
  before_action :get_user
  before_action :get_game
  before_action :set_player, only: [:show, :destroy]

  def index
    @player = @game.players
    render json: {
        messages: "Loaded players",
        status: "SUCCESS",
        data: @player,
    }, status: :ok
  end

  def show
    @player = @game.players.find(params[:game_id])
    render json: {messages: "Loaded player", status: "SUCCESS", data: @game},
           status: :ok
  end

  def create
    @player = @game.players.build(player_params)
    if @player.save
      render json: {status: "SUCCESS", data: @player},
             status: :ok
    else
      render json: {messages: "Player not created", status: "ERROR", data: @player.errors},
             status: :unprocessable_entity
    end
  end

  def update
    @player = @game.players.find(params[:id])
    if @player.update_attributes(player_params)
      render json: {messages: "Updated player", status: "SUCCESS", data: @player},
             status: :ok
    else
      render json: {messages: "Player not updated", status: "ERROR", data: @player.errors},
             status: :unprocessable_entity
    end
  end

  def destroy
    @player = @game.players.find(params[:id])
    @player.destroy
    render json: {messages: "Deleted Player", status: "SUCCESS", data: @player},
           status: :ok
  end

  private def get_user
    @user = User.find(params[:user_id])
  end

  private def get_game
    @game = @user.games.find(params[:game_id])
  end

  private def set_player
    @player = @game.players.find(params[:id])
  end

  private def player_params
    params.permit(:name, :points, :game_id)
  end
end
