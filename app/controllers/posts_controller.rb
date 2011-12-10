class PostsController < ApplicationController
  respond_to :json, :html

  def create
    @post = Post.create!(params[:post])
    @goal = Goal.find(params[:post][:goal_id])

    respond_with do |format|
      format.html { redirect_to @goal }
      format.json { render :json => {} }
    end
  end
end
