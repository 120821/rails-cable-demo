require 'test_helper'

class Blog1sControllerTest < ActionController::TestCase
  setup do
    @blog1 = blog1s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blog1s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blog1" do
    assert_difference('Blog1.count') do
      post :create, blog1: { content: @blog1.content, title: @blog1.title }
    end

    assert_redirected_to blog1_path(assigns(:blog1))
  end

  test "should show blog1" do
    get :show, id: @blog1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blog1
    assert_response :success
  end

  test "should update blog1" do
    patch :update, id: @blog1, blog1: { content: @blog1.content, title: @blog1.title }
    assert_redirected_to blog1_path(assigns(:blog1))
  end

  test "should destroy blog1" do
    assert_difference('Blog1.count', -1) do
      delete :destroy, id: @blog1
    end

    assert_redirected_to blog1s_path
  end
end
