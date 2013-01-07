class VotesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.votes.create(thumb: params[:thumb])
    redirect_to posts_path
  end
end