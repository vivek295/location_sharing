class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.where(username: params[:username]).first
    @posts = @user && @user.posts.where(public: true)
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
    @users = User.all_except(current_user)
    respond_to do |format|
      format.html
      format.js
      format.json { 
        render json: {:users => @users}
     } 
    end
  end
end
