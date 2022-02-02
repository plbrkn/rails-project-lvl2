# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def new
    @post = Post.new
    @post_categorys = PostCategory.all.map { |c| [c.name, c.id] }
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      redirect_to root_url, notice: t('post.successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @likes_count = @post.likes.count
    @current_user_like = PostLike.find_by(post: @post, user: current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_category_id)
  end
end
