# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @post = posts(:one)
    @comment = post_comments(:one)
    @params = {
      content: Faker::Lorem.sentence
    }
  end

  test 'should create post comment' do
    sign_in @user

    post post_comments_path(@post), params: { post_comment: @params }

    assert { PostComment.find_by(@params) }
  end

  test 'should create post child comment' do
    sign_in @user
    parent_comment = @post.comments.last

    post post_comments_path(@post), params: { post_comment: { parent_id: parent_comment.id, **@params } }

    assert { PostComment.find_by(@params) }
    assert { PostComment.find_by({ ancestry: parent_comment.id, **@params }) }
  end
end
