class MessagesController < ApplicationController
  def index
    @note = Note.find_by(character: params[:note_character])
    @messages = Message.where(note_id: @note.id).order("created_at DESC")
  end
end
