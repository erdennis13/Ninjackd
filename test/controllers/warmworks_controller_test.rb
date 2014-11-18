require 'test_helper'

class WarmworksControllerTest < ActionController::TestCase
  setup do
    @warmwork = warmworks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:warmworks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create warmwork" do
    assert_difference('Warmwork.count') do
      post :create, warmwork: { warmup_id: @warmwork.warmup_id, workout_id: @warmwork.workout_id }
    end

    assert_redirected_to warmwork_path(assigns(:warmwork))
  end

  test "should show warmwork" do
    get :show, id: @warmwork
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @warmwork
    assert_response :success
  end

  test "should update warmwork" do
    patch :update, id: @warmwork, warmwork: { warmup_id: @warmwork.warmup_id, workout_id: @warmwork.workout_id }
    assert_redirected_to warmwork_path(assigns(:warmwork))
  end

  test "should destroy warmwork" do
    assert_difference('Warmwork.count', -1) do
      delete :destroy, id: @warmwork
    end

    assert_redirected_to warmworks_path
  end
end
