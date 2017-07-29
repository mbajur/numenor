class Api::CurrentUserController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Player.first || {}
  end

  def fov
    render json: MapAreaTile.all
  end

  def go_to
    player = Player.last.update_attributes(x: params[:x], y: params[:y])

    AreasChannel.broadcast_to(
      Player.last,
      title: 'New things!',
      body: 'All the news fit to print'
    )

    render json: player
  end
end
