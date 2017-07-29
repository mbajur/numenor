class AreasChannel < ApplicationCable::Channel
  def subscribed
    stream_from Player.last
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
