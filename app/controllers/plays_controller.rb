class PlaysController < ApplicationController
  before_action :find_game, :set_array, only: [:new]

  def new
    @plays = Play.all
    @play = Play.new(game: @game)
  end

  def create
    @play = Play.new(play_params)
    byebug
    @play.save!
  end

  private

  def find_game
    @game = Game.find(params[:game_id])
  end

  def set_array
    @array = Array.new(10)
    game_images = @game.images

    @array.each_with_index do |e, i|
      next unless e.nil?
      @array[i] = rails_blob_path(
        game_images[rand(0..game_images.size - 1)],
        only_path: true
      )
    end
  end

  def play_params
    params.require(:play).permit(:image_url, :time, :game_id)
  end
end
