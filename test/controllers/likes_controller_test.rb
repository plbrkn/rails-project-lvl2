# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @post = posts(:one)
    @like = post_likes(:one)
    @post_without_like = posts(:not_like)
  end

  test 'should create post like' do
    sign_in @user

    post post_likes_path(@post_without_like)

    assert { @post_without_like.likes.find_by(user_id: @user.id) }
  end

  test 'should delete post like' do
    sign_in @user

    delete post_like_path(@post, @like)

    assert { !@post.likes.find_by(id: @like.id) }
  end
end
