# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @post = posts(:one)
  end

  test 'should create post comment' do
    sign_in @user
    post post_comments_path(@post), params: { post_comment: { content: 'New comment' } }

    comment = PostComment.last

    assert { comment.user == @user }
    assert { comment.post == @post }
  end

  test 'should create post child comment' do
    sign_in @user

    post post_comments_path(@post), params: { post_comment: { content: 'New comment' } }

    parent_comment = PostComment.last

    post post_comments_path(@post, ancestry: parent_comment.id), params: { post_comment: { content: 'New comment1' } }

    child_comment = PostComment.last

    assert { parent_comment.user == child_comment.user }
    assert { parent_comment.post == child_comment.post }
    assert { parent_comment.id == child_comment.ancestry.to_i }
  end
end
