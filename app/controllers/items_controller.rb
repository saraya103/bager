class ItemsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @note = Note.find_by(character: params[:note_character])
    @items = Item.where(note_id: @note.id)
  end

  def new
    @item = Item.new
    @note = Note.find_by(character: params[:note_character])
  end

  def create
    @item = Item.new(item_params)
    @note = Note.find_by(character: params[:note_char])
    if @item.save
      redirect_to note_items_path(@note.character)
    else
      @note = @item.note
      @items = @note.items
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @note = Note.find_by(character: params[:note_character])
  end

  def edit
    @item = Item.find(params[:id])
    @note = Note.find_by(character: params[:note_character])
  end

  def update
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to note_items_path(params[:note_character])
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :count, :condition, :memo, :image, :note_char).merge(note_id: params[:note_character], user_id: current_user.id)
  end
end
