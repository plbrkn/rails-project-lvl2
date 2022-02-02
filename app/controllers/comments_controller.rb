# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  def new
    @post_comment = PostComment.new
  end

  def create
    ancestry = params[:ancestry]

    post_comment = PostComment.new(post_comment_params)
    post_comment.user = current_user
    post_comment.post = post

    if ancestry
      post_comment.parent_id = ancestry.to_i
    end

    post_comment.save

    redirect_to post
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content)
  end

  def post
    Post.find(params[:post_id])
  end
end
