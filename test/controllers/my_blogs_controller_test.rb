require 'test_helper'

class MyBlogsControllerTest < ActionController::TestCase
  setup do
    @my_blog = my_blogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_blogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_blog" do
    assert_difference('MyBlog.count') do
      post :create, my_blog: { content: @my_blog.content, title: @my_blog.title }
    end

    assert_redirected_to my_blog_path(assigns(:my_blog))
  end

  test "should show my_blog" do
    get :show, id: @my_blog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_blog
    assert_response :success
  end

  test "should update my_blog" do
    patch :update, id: @my_blog, my_blog: { content: @my_blog.content, title: @my_blog.title }
    assert_redirected_to my_blog_path(assigns(:my_blog))
  end

  test "should destroy my_blog" do
    assert_difference('MyBlog.count', -1) do
      delete :destroy, id: @my_blog
    end

    assert_redirected_to my_blogs_path
  end
end
