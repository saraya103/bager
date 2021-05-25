class NoteChannel < ApplicationCable::Channel
  def subscribed
    stream_from "note_channel"
  end

  def unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast 'note_channel', message: data['message']
  end
end