class FeedsController < ApplicationController
  before_action :authenticate_user!

  def home
    @posts = Post.all.order('created_at DESC').select { |p| p.public == true or (p.share_with.include?(current_user.id))}
    respond_to do |format|
      format.html
      format.js
    end
  end
end
