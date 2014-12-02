require 'test_helper'

class DailytipsControllerTest < ActionController::TestCase
  setup do
    @dailytip = dailytips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dailytips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dailytip" do
    assert_difference('Dailytip.count') do
      post :create, dailytip: { tip: @dailytip.tip }
    end

    assert_redirected_to dailytip_path(assigns(:dailytip))
  end

  test "should show dailytip" do
    get :show, id: @dailytip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dailytip
    assert_response :success
  end

  test "should update dailytip" do
    patch :update, id: @dailytip, dailytip: { tip: @dailytip.tip }
    assert_redirected_to dailytip_path(assigns(:dailytip))
  end

  test "should destroy dailytip" do
    assert_difference('Dailytip.count', -1) do
      delete :destroy, id: @dailytip
    end

    assert_redirected_to dailytips_path
  end
end
