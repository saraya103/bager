class LogsController < ApplicationController
  def index
    @logs = Log.includes(:user)
    @note = Note.find_by(character: params[:note_character])
  end

  def show
    @log = Log.find(params[:id])
    @note = Note.find_by(character: params[:note_character])
  end
end
