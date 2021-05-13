class ListsController < ApplicationController
  def index
    @lists = List.includes(:note)
    @list = List.new
    @note = Note.find_by(character: params[:note_character])
  end

  def new 
    @list = List.new
    @note = Note.find_by(character: params[:note_character])
  end

  def create
    @list = List.new(list_params)
    @note = Note.find_by(character: params[:note_char])
    if @list.save
      redirect_to note_lists_path(@note.character)
    else
      render :new
    end
  end

  def destroy
    @note = Note.find_by(character: params[:note_char])
    @list = List.find(params[:id])
    @list.destroy
    redirect_to note_lists_path(params[:note_character])
  end

  private
  def list_params
    params.permit(:item_id).merge(note_id: params[:note_character])
  end

  def delete_item
        params[:itemcheck].each do | di1,di2 |
      if di2 == "1"
        @list = Lint.find_by(item_id: di1)
        @list.destroy
      end
    end
  end
end
