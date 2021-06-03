class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "note_channel_#{message.note_id}", message: render_message(message)
  end

  private

  def render_message(message)
    ApplicationController.render_with_signed_in_user(message.user, partial: 'messages/message', locals: { message: message })
  end
end