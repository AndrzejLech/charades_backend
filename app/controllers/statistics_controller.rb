class StatisticsController < ApplicationController
  before_action :get_user
  before_action :get_category
  before_action :get_games
  before_action :get_players

  def create
    @game = @game
    @players = @players
    @category = @categories
    render json: {
      messages: "Loaded statistic",
      status: "SUCCESS",
      data: { game: @game,
              category: @category,
              players: @players },
    }, status: :ok
  end

  private def get_category
    @categories = @user.categories.find(params[:category_id])
  end

  private def get_user
    @user = User.find(params[:user_id])
  end

  private def get_games
    @game = @user.games.find(params[:game_id])
  end

  private def get_players
    @players = @game.players
  end

  private def game_params
    params.permit(:user_id, :category_id, :game_id)
  end
end
