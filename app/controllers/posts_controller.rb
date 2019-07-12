class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
# 後でユーザーwpフォローしているか？条件分岐させてソートする
    @users = User.all
    @new_comment = Comment.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update
    redirect_to post_path(post)
  end

  def new
    @new_post = Post.new
    @new_post.tags.build
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:post_text, :post_image, tags_attributes: [:id, :hashtag, :_destroy])
  end

end
