class Admin::UsersController < Admin::BaseController
  def index
    @users = User.order("created_at DESC").page(params[:page]).per(25)
  end

  def show
    @user = User.find_by :name => /\A#{params[:id]}\z/i
  end
end
