class RoomChannel < ApplicationCable::Channel
  
  def subscribed
    stream_from "room_channel"
    puts "Se conectó: #{current_user.email}"
    # ActionCable.server.broadcast("room_channel", { message: "Hola" })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast("room_channel", data)
  end


end
