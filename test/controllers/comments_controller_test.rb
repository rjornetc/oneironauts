require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get vote_up" do
    get :vote_up
    assert_response :success
  end

  test "should get vote_down" do
    get :vote_down
    assert_response :success
  end

  test "should get mark_as_spam" do
    get :mark_as_spam
    assert_response :success
  end

end
