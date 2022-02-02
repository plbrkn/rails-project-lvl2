# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    PostLike.create(post: post, user: current_user)

    redirect_to post
  end

  def destroy
    like = PostLike.find(params[:id])
    like.destroy

    redirect_to post
  end

  private

  def post
    Post.find(params[:post_id])
  end
end
