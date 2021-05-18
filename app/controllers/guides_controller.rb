class GuidesController < ApplicationController
  before_action :login_skip

  def index
  end

  private
  def login_skip
    if user_signed_in?
      redirect_to notes_path
    end
  end
end
