class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all.order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
      format.json { 
        render json: {:users => @users}
     } 
    end
  end

  def user_list
    @users = User.all
    respond_to do |format|
      format.html
      format.js
      format.json { 
        render json: {:users => @users}
     } 
    end
  end
end
