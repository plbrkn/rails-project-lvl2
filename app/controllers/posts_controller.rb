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
    @likes_count = @post.likes.count
    @current_user_like = @post.likes.find_by(user: current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_category_id)
  end
end
