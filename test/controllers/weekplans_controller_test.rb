require 'test_helper'

class WeekplansControllerTest < ActionController::TestCase
  setup do
    @weekplan = weekplans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weekplans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weekplan" do
    assert_difference('Weekplan.count') do
      post :create, weekplan: { friday_workout_id: @weekplan.friday_workout_id, monday_workout_id: @weekplan.monday_workout_id, name: @weekplan.name, saturday_workout_id: @weekplan.saturday_workout_id, sunday_workout_id: @weekplan.sunday_workout_id, thursday_workout_id: @weekplan.thursday_workout_id, tuesday_workout_id: @weekplan.tuesday_workout_id, wednesday_workout_id: @weekplan.wednesday_workout_id }
    end

    assert_redirected_to weekplan_path(assigns(:weekplan))
  end

  test "should show weekplan" do
    get :show, id: @weekplan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weekplan
    assert_response :success
  end

  test "should update weekplan" do
    patch :update, id: @weekplan, weekplan: { friday_workout_id: @weekplan.friday_workout_id, monday_workout_id: @weekplan.monday_workout_id, name: @weekplan.name, saturday_workout_id: @weekplan.saturday_workout_id, sunday_workout_id: @weekplan.sunday_workout_id, thursday_workout_id: @weekplan.thursday_workout_id, tuesday_workout_id: @weekplan.tuesday_workout_id, wednesday_workout_id: @weekplan.wednesday_workout_id }
    assert_redirected_to weekplan_path(assigns(:weekplan))
  end

  test "should destroy weekplan" do
    assert_difference('Weekplan.count', -1) do
      delete :destroy, id: @weekplan
    end

    assert_redirected_to weekplans_path
  end
end
