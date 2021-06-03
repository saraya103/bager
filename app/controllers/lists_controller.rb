class ListsController < ApplicationController
  def index
    @note = Note.find_by(character: params[:note_character])
    @lists = List.where(note_id: @note.id)
    @list = List.new
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

  def update
    @list = List.find(params[:id])
    @note = Note.find_by(character: params[:note_character])
    new_log
    if @log.save
      @list.destroy
      redirect_to note_lists_path(params[:note_character])
    end
  end

  def destroy
    @list = List.find(params[:id])
    @note = Note.find_by(character: params[:note_char])
    @list.destroy
    redirect_to note_lists_path(params[:note_character])
  end

  private
  def list_params
    params.permit(:item_id).merge(note_id: params[:note_character])
  end
  
  def new_log
    @log = Log.new
    @log.name = @list.item.name
    @log.price = @list.item.price
    @log.count = @list.item.count
    @log.condition = @list.item.condition
    @log.memo = @list.item.memo
    @log.buyer = current_user.nickname
    @log.note_id = @list.item.note_id
    @log.user_id = @list.item.user_id
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
