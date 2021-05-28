class MessagesController < ApplicationController
  def index
    @messages = Message.includes(:note).order("created_at DESC")
    @note = Note.find_by(character: params[:note_character])
    # @messages = @note.messages.order("created_at DESC")
  end
end
