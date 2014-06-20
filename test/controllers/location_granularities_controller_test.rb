require 'test_helper'

class LocationGranularitiesControllerTest < ActionController::TestCase
  setup do
    @location_granularity = location_granularities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_granularities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_granularity" do
    assert_difference('LocationGranularity.count') do
      post :create, location_granularity: { description: @location_granularity.description, user_id: @location_granularity.user_id }
    end

    assert_redirected_to location_granularity_path(assigns(:location_granularity))
  end

  test "should show location_granularity" do
    get :show, id: @location_granularity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_granularity
    assert_response :success
  end

  test "should update location_granularity" do
    patch :update, id: @location_granularity, location_granularity: { description: @location_granularity.description, user_id: @location_granularity.user_id }
    assert_redirected_to location_granularity_path(assigns(:location_granularity))
  end

  test "should destroy location_granularity" do
    assert_difference('LocationGranularity.count', -1) do
      delete :destroy, id: @location_granularity
    end

    assert_redirected_to location_granularities_path
  end
end
