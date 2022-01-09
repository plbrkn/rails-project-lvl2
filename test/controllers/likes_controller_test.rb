# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @post = posts(:one)
  end

  test 'should create post like' do
    sign_in @user
    post post_likes_path(@post)

    like = PostLike.last

    assert { like.user == @user }
    assert { like.post == @post }
  end

  test 'should delete post like' do
    sign_in @user
    like = PostLike.create(user: @user, post: @post)
    likes_count = @post.likes.count

    delete post_like_path(id: like.id, post_id: @post.id)

    assert { likes_count == @post.likes.count + 1 }
    assert { PostLike.exists?(like.id).nil? == false }
  end
end
