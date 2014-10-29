require 'test_helper'

class WorkoutbitsControllerTest < ActionController::TestCase
  setup do
    @workoutbit = workoutbits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workoutbits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workoutbit" do
    assert_difference('Workoutbit.count') do
      post :create, workoutbit: { exercise_id: @workoutbit.exercise_id, reps: @workoutbit.reps, sets: @workoutbit.sets, workout_id: @workoutbit.workout_id }
    end

    assert_redirected_to workoutbit_path(assigns(:workoutbit))
  end

  test "should show workoutbit" do
    get :show, id: @workoutbit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workoutbit
    assert_response :success
  end

  test "should update workoutbit" do
    patch :update, id: @workoutbit, workoutbit: { exercise_id: @workoutbit.exercise_id, reps: @workoutbit.reps, sets: @workoutbit.sets, workout_id: @workoutbit.workout_id }
    assert_redirected_to workoutbit_path(assigns(:workoutbit))
  end

  test "should destroy workoutbit" do
    assert_difference('Workoutbit.count', -1) do
      delete :destroy, id: @workoutbit
    end

    assert_redirected_to workoutbits_path
  end
end
