class UsersController < ApplicationController
  def index
    @allusers = User.page(params[:page]).per(20)
    @buyers = User.with_role(:buyer).page(params[:page]).per(20)
    @sellers = User.with_role(:seller).page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
  end
end
