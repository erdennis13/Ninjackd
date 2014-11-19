require 'test_helper'

class WeeklyplansControllerTest < ActionController::TestCase
  setup do
    @weeklyplan = weeklyplans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weeklyplans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weeklyplan" do
    assert_difference('Weeklyplan.count') do
      post :create, weeklyplan: { name: @weeklyplan.name }
    end

    assert_redirected_to weeklyplan_path(assigns(:weeklyplan))
  end

  test "should show weeklyplan" do
    get :show, id: @weeklyplan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weeklyplan
    assert_response :success
  end

  test "should update weeklyplan" do
    patch :update, id: @weeklyplan, weeklyplan: { name: @weeklyplan.name }
    assert_redirected_to weeklyplan_path(assigns(:weeklyplan))
  end

  test "should destroy weeklyplan" do
    assert_difference('Weeklyplan.count', -1) do
      delete :destroy, id: @weeklyplan
    end

    assert_redirected_to weeklyplans_path
  end
end
