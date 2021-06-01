class GuidesController < ApplicationController
  before_action :login_skip, only: :index

  def index
  end

  def new
    @note = Note.new
  end

  def create
    @user = User.find(guide_params[:user_id])
    @note = Note.find(guide_params[:id])
    if @user.notes << @note
      redirect_to notes_path
    else
      render :new
    end
  end

  private
  def login_skip
    if user_signed_in?
      redirect_to notes_path
    end
  end

  def guide_params
    params.require(:note).permit(:id).merge(user_id: current_user.id)
  end
end
