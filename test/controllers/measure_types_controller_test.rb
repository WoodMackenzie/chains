require 'test_helper'

class MeasureTypesControllerTest < ActionController::TestCase
  setup do
    @measure_type = measure_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:measure_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create measure_type" do
    assert_difference('MeasureType.count') do
      post :create, measure_type: { description: @measure_type.description, user_id: @measure_type.user_id }
    end

    assert_redirected_to measure_type_path(assigns(:measure_type))
  end

  test "should show measure_type" do
    get :show, id: @measure_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @measure_type
    assert_response :success
  end

  test "should update measure_type" do
    patch :update, id: @measure_type, measure_type: { description: @measure_type.description, user_id: @measure_type.user_id }
    assert_redirected_to measure_type_path(assigns(:measure_type))
  end

  test "should destroy measure_type" do
    assert_difference('MeasureType.count', -1) do
      delete :destroy, id: @measure_type
    end

    assert_redirected_to measure_types_path
  end
end
