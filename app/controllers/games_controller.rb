class GamesController < ApplicationController
  def index
  end

  def new
    @game = Game.new
  end

  def create
    game =  Game.new(game_params)
    game.save!

    redirect_to new_play_path(game_id: game.id)
  rescue
    render :new
  end

  private

  def game_params
    params.require(:game).permit(images: [])
  end
end
