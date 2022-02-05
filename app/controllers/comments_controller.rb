# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    post_comment = post.comments.build(post_comment_params)
    post_comment.user = current_user

    if post_comment.save
      redirect_to post, notice: t('comment.successfully')
    else
      redirect_to post, alert: t('comment.error')
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end

  def post
    Post.find(params[:post_id])
  end
end
