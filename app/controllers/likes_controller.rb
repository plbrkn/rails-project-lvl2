# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = PostLike.new
    @like.user = current_user
    @like.post = @post

    @like.save

    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])

    like = PostLike.find(params[:id])
    like.destroy

    redirect_to @post
  end
end
