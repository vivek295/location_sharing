class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def new 
    @post = Post.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    post = current_user.posts.build(post_params)
    post.share_with = params[:post][:share_with].reject { |id| id == "" }
    if post.save
      flash[:success] = "Post created!"
      redirect_to root_path
    else
      @error = post.errors.messages[:longitude].first || "Error creating Post"
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def index
    @posts = Post.all.order('created_at DESC').select { |p| p.public == true or (p.share_with.include?(current_user.id)) }
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def correct_user
    @post = current_user.posts.find_by_id(params[:id])
    redirect_to root_path if @post.nil?
  end

  def post_params
    params.require(:post).permit(:caption, :longitude, :lattitude, :location_name, :public)
  end
end
