class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :note_set, only: [:index, :new, :show, :edit]
  before_action :item_set, only: [:show, :edit, :update, :destroy]
  
  def index
    @note = Note.find_by(character: params[:note_character])
    @items = Item.where(note_id: @note.id)
  end

  def new
    @item = Item.new
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to note_items_path(params[:note_char])
    else
      @note = @item.note
      @items = @note.items
      render :edit
    end
  end

  def destroy
    item.destroy
    redirect_to note_items_path(params[:note_character])
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :count, :condition, :memo, :image, :note_char).merge(note_id: params[:note_character], user_id: current_user.id)
  end

  def note_set
    @note = Note.find_by(character: params[:note_character])
  end

  def item_set
    @item = Item.find(params[:id])
  end
end
