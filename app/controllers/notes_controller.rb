class NotesController < ApplicationController
  def index
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    set_char
    binding.pry
    if @note.save!
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def note_params
    params.require(:note).permit(:genre_id, :list_name, :log_name, :reserve_name, :item_name, user_ids:[]).merge(owner: current_user.id)
  end

  def set_char
    while @note.character.blank? || Note.find_by(character: @note.character).present? do
      @note.character = SecureRandom.alphanumeric(12)
    end
    @note.password = SecureRandom.alphanumeric(6)
  end
end
