# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @post = posts(:one)
    @params = {
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.sentence,
      post_category_id: @post.post_category.id
    }
  end

  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should get new' do
    sign_in @user
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    sign_in @user

    assert_difference('Post.count') do
      post posts_url, params: { post: @params }
    end
    assert_redirected_to root_url

    assert { Post.find_by(@params) }
  end
end
