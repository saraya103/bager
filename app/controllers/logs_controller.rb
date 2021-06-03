class LogsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @note = Note.find_by(character: params[:note_character])
    @logs = Log.where(note_id: @note.id)
  end

  def show
    @log = Log.find(params[:id])
    @note = Note.find_by(character: params[:note_character])
  end
end
