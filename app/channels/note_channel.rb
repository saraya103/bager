class NoteChannel < ApplicationCable::Channel
  def subscribed
    stream_from "note_channel_#{params['note']}" 
  end

  def unsubscribed
  end

  def speak(data)
    Message.create! content: data['message'], user_id: current_user.id, note_id: params['note']
  end
end