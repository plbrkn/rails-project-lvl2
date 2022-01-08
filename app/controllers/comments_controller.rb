# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @post_comment = PostComment.new
  end

  def create
    ancestry = params[:ancestry]

    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user = current_user
    @post_comment.post = @post

    if ancestry
      @post_comment.parent_id = ancestry.to_i
    end

    @post_comment.save

    redirect_to @post
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content)
  end
end
