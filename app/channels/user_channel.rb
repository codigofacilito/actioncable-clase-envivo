class UserChannel < ApplicationCable::Channel
 @@ids = []

def subscribed
  ActionCable.server.broadcast "user_channel", {user_id: current_user.id, action:"login"}

  stream_from "user_channel:#{current_user.id}"
  stream_from "user_channel"
  
  @@ids.each do |id|
    ActionCable.server.broadcast "user_channel:#{current_user.id}", {user_id: id, action:"login"}
  end

  @@ids.push(current_user.id)
end

def unsubscribed
  # Any cleanup needed when channel is unsubscribed
  @@ids.delete(current_user.id)
  ActionCable.server.broadcast "user_channel", {user_id: current_user.id, action:"logout"}
end

def receive(data)
  if data["type"] == "ping"
    puts data
    ActionCable.server.broadcast("user_channel:#{data["user_id"]}", { user_id: current_user.id, action: "ping" })
    return
  end


  ActionCable.server.broadcast("user_channel", { message: data["message"], email: current_user.email, action: "new_message" });
end
end
