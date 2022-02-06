# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_url, notice: t('post.successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @likes_count = @post.post_likes_count
    @comments = make_comments

    @current_user_like = @post.likes.find_by(user: current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_category_id)
  end

  def make_comments
    PostComment.includes(:user)
               .where(post_id: params[:id])
               .arrange_serializable do |parent, children|
      {
        id: parent.id,
        content: parent.content,
        user_email: parent.user.email,
        children: children
      }
    end
  end
end
