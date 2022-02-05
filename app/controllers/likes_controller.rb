# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post.likes.find_or_create_by(user: current_user)

    redirect_to post
  end

  def destroy
    like = post.likes.find_by(user: current_user)
    like&.destroy

    redirect_to post
  end

  private

  def post
    Post.find(params[:post_id])
  end
end
