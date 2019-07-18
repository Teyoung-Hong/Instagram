class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
    # 後でユーザーidフォローしているか？条件分岐させてソートする
    @users = User.all
    @user_search = if params[:search]
      User.search(params[:search])
    else
      User.all
    end
    @new_comment = Comment.new
  end

  def show
    @post = Post.find(params[:id])
    @new_comment = Comment.new
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
    @new_tag = @new_post.tags.build
    @new_tag_score = @new_tag.tag_scores.build
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save
    redirect_to root_path
  end

#  def search 
 #   @users = User.search(params[:search])
  #end

  private
  def post_params
    params.require(:post).permit(:post_text, :post_image, tags_attributes: [:id, :hashtag, :_destroy, tag_scores_attributes: [:id, :score, :_destroy]])
  end
end
