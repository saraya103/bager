class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :owner_check, only: [:show, :edit, :destroy]

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
  end

  def edit
  end

  def update
    @note = Note.find(params[:character])
    redirect_to root_path unless @note.owner == current_user.id
    @user = User.find(params.require(:owner))
    if @note.update(edit_params)
      redirect_to notes_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def owner_check
    @note = Note.find_by(character: params[:character])
    redirect_to root_path unless @note.owner == current_user.id
  end

  def note_params
    params.require(:note).permit(:title, :genre_id, :list_name, :log_name, :reserve_name, :item_name, user_ids:[]).merge(owner: current_user.id, owner_name: current_user.nickname)
  end

  def edit_params
    params.require(:note).permit(:title, :genre_id, :list_name, :log_name, :reserve_name, :item_name).merge(owner: @user.id, owner_name: @user.nickname)
  end

  def set_char
    while @note.character.blank? || Note.find_by(character: @note.character).present? do
      @note.character = SecureRandom.alphanumeric(12)
    end
    @note.password = SecureRandom.alphanumeric(6)
  end
end
