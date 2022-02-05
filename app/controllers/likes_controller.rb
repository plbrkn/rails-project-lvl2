# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    unless post.likes.find_by(user: current_user)
      post.likes.create(user: current_user)
    end
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
