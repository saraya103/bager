class ReservesController < ApplicationController
  def index
    @reserves = Reserve.includes(:note)
    @reserve = Reserve.new
    @note = Note.find_by(character: params[:note_character])
  end

  def new
    @reserve = Reserve.new
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def reserve_params
  end

  def set_date
  end

  def check_once
  end
end
