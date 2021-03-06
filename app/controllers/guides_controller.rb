class GuidesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :login_skip, only: :index

  def index
  end

  def new
    @note = Note.new
  end

  def create
    @user = User.find(guide_params[:user_id])
    @note_id = Note.find_by(character: guide_params[:id])
    @note_pass = Note.find_by(password: guide_params[:password])
    password_check
  end

  private
  def login_skip
    if user_signed_in?
      redirect_to notes_path
    end
  end

  def guide_params
    params.require(:note).permit(:id, :password).merge(user_id: current_user.id)
  end

  def password_check
    if @note_id == nil || @note_pass == nil
      count_check
    elsif @note_id.id == @note_pass.id
      @user.notes << @note_id
      redirect_to notes_path, notice: 'ノートに参加しました！'
    else
      count_check
    end
  end

  def count_check
    if @user.count == 4
      @user.update_attribute(:stop, @user.stop + 1 )
    end
    @user.update_attribute(:count, @user.count + 1 )
    redirect_to new_guide_path, alert: 'エラー：正しい情報を入力してください。'
  end
end
