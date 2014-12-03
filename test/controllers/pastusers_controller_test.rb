require 'test_helper'

class PastusersControllerTest < ActionController::TestCase
  setup do
    @pastuser = pastusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pastusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pastuser" do
    assert_difference('Pastuser.count') do
      post :create, pastuser: { email: @pastuser.email, username: @pastuser.username }
    end

    assert_redirected_to pastuser_path(assigns(:pastuser))
  end

  test "should show pastuser" do
    get :show, id: @pastuser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pastuser
    assert_response :success
  end

  test "should update pastuser" do
    patch :update, id: @pastuser, pastuser: { email: @pastuser.email, username: @pastuser.username }
    assert_redirected_to pastuser_path(assigns(:pastuser))
  end

  test "should destroy pastuser" do
    assert_difference('Pastuser.count', -1) do
      delete :destroy, id: @pastuser
    end

    assert_redirected_to pastusers_path
  end
end
