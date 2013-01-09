class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post.comments.create(params[:comment])
    if !post.valid?
      redirect_to post_path(post), alert: post.errors.full_messages.join("<br>").html_safe
    else
      redirect_to post_path(post), notice: "Your comment was added"
    end
  end
end