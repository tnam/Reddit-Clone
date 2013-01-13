class PostsController < ApplicationController
  before_filter :require_user, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path, notice: "Post created successfully"
    else
      flash[:alert] = @post.errors.full_messages.join("<br>").html_safe
      render 'new'
    end
  end

end