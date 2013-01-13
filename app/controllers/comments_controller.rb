class CommentsController < ApplicationController
  before_filter :require_user, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_path(@post), notice: "Your comment was added"
    else
      flash[:alert] = @comment.errors.full_messages.join("<br>").html_safe
      render 'posts/show'
    end
  end
end