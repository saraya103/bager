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
    set_date
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
      check_once
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

  def set_date
    case @reserve.next_id
    when 0
      @reserve.date = Date.today.next_year(1000)
    when 1
      @reserve.date = Date.tomorrow
    when 2
      @reserve.date = Date.today.next_day(2)
    when 3
      @reserve.date = Date.today.next_day(3)
    when 4
      @reserve.date = Date.today.next_day(4)
    when 5
      @reserve.date = Date.today.next_day(5)
    when 6
      @reserve.date = Date.today.next_day(6)
    when 7
      @reserve.date = Date.today.next_week
    when 8
      @reserve.date = Date.today.next_week(2)
    when 9
      @reserve.date = Date.today.next_week(3)
    when 10
      @reserve.date = Date.today.next_month
    when 11
      @reserve.date = Date.today.next_month(2)
    when 12
      @reserve.date = Date.today.next_month(3)
    when 13
      @reserve.date = Date.today.next_month(6)
    else
      @reserve.date = Date.today.next_year
    end
  end

  def check_once
    case @reserve.once_id
    when 0
      set_date
      @reserve.save
    when 1
      @reserve.next_id = 0
      @reserve.date = Date.today.next_year(1000)
      @reserve.save
    else
      @reserve.destroy
    end
  end
end
