class ReservesController < ApplicationController
  def index
    @reserves = Reserve.includes(:note)
    @reserve = Reserve.new
    @note = Note.find_by(character: params[:note_character])
  end

  def new
    @reserve = Reserve.new
    @note = Note.find_by(character: params[:note_character])
  end

  def create
    @reserve = Reserve.new(reserve_params)
    @note = Note.find_by(character: params[:note_char])
    @reserve.set_date
    if @reserve.save
      redirect_to note_reserves_path(@note.character)
    else
      render :index
    end
  end

  def show
  end

  def edit
  end

  def update
    @reserve = Reserve.find(params[:id])
    @note = Note.find_by(character: params[:note_character])
    if List.find_by(item_id: @reserve.item_id) == nil
      set_list
      @list.save
      @reserve.check_once
    end
    redirect_to note_reserves_path(params[:note_character])
  end

  def destroy
    @reserve = Reserve.find(params[:id])
    @note = Note.find_by(character: params[:note_char])
    @reserve.destroy
    redirect_to note_reserves_path(params[:note_character])
  end

  private
  def reserve_params
    params.require(:reserve).permit(:item_id, :next_id, :once_id).merge(note_id: params[:note_character])
  end

  def set_list
    @list = List.new
    @list.note_id = @reserve.note_id
    @list.item_id = @reserve.item_id
  end
end
