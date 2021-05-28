class MessagesController < ApplicationController
  def show
    @note = Note.find_by(character: params[:character])
    @messages = @note.messages.order("created_at DESC")
  end
end
