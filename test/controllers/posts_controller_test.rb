# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @post = posts(:one)
  end

  test 'should get new' do
    sign_in @user
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    sign_in @user
    post posts_url, params: { post: { title: 'New Post', body: 'New Body', post_category_id: @post.post_category.id } }
    assert_redirected_to root_url
  end
end
