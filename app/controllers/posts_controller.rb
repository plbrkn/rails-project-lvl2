# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
    @post_categorys = PostCategory.all.map { |c| [c.name, c.id] }
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      redirect_to root_url, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :body, :post_category_id)
  end
end
