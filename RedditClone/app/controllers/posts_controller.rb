class PostsController < ApplicationController
  before_action :require_user, except: [:show]
  def new
    @subs = Sub.all
  end

  def edit
    @subs = Sub.all
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post successfully posted yo"
      redirect_to root_url
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    @post.save
    redirect_to post_url(@post)
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:url, :content, :title, :author_id, sub_ids:[])
  end
end
