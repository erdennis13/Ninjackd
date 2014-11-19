require 'test_helper'

class WeeklybitsControllerTest < ActionController::TestCase
  setup do
    @weeklybit = weeklybits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weeklybits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weeklybit" do
    assert_difference('Weeklybit.count') do
      post :create, weeklybit: { day: @weeklybit.day, weeklyplan_id: @weeklybit.weeklyplan_id, workout_id: @weeklybit.workout_id }
    end

    assert_redirected_to weeklybit_path(assigns(:weeklybit))
  end

  test "should show weeklybit" do
    get :show, id: @weeklybit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weeklybit
    assert_response :success
  end

  test "should update weeklybit" do
    patch :update, id: @weeklybit, weeklybit: { day: @weeklybit.day, weeklyplan_id: @weeklybit.weeklyplan_id, workout_id: @weeklybit.workout_id }
    assert_redirected_to weeklybit_path(assigns(:weeklybit))
  end

  test "should destroy weeklybit" do
    assert_difference('Weeklybit.count', -1) do
      delete :destroy, id: @weeklybit
    end

    assert_redirected_to weeklybits_path
  end
end
