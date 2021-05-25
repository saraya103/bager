class NotesController < ApplicationController
  def index
    @notes = User.find(current_user.id).notes
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    set_char
    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @note = Note.find_by(character: params[:character])
    @comments = @note.comments
  end

  private
  def note_params
    params.require(:note).permit(:title, :genre_id, :list_name, :log_name, :reserve_name, :item_name, user_ids:[]).merge(owner: current_user.id, owner_name: current_user.nickname)
  end

  def set_char
    while @note.character.blank? || Note.find_by(character: @note.character).present? do
      @note.character = SecureRandom.alphanumeric(12)
    end
    @note.password = SecureRandom.alphanumeric(6)
  end
end
