class RoomImageChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'room_image_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
