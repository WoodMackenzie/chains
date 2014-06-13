require 'test_helper'

class UnitsOfMeasuresControllerTest < ActionController::TestCase
  setup do
    @units_of_measure = units_of_measures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:units_of_measures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create units_of_measure" do
    assert_difference('UnitsOfMeasure.count') do
      post :create, units_of_measure: { description: @units_of_measure.description, measure_type_id: @units_of_measure.measure_type_id, user_id: @units_of_measure.user_id }
    end

    assert_redirected_to units_of_measure_path(assigns(:units_of_measure))
  end

  test "should show units_of_measure" do
    get :show, id: @units_of_measure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @units_of_measure
    assert_response :success
  end

  test "should update units_of_measure" do
    patch :update, id: @units_of_measure, units_of_measure: { description: @units_of_measure.description, measure_type_id: @units_of_measure.measure_type_id, user_id: @units_of_measure.user_id }
    assert_redirected_to units_of_measure_path(assigns(:units_of_measure))
  end

  test "should destroy units_of_measure" do
    assert_difference('UnitsOfMeasure.count', -1) do
      delete :destroy, id: @units_of_measure
    end

    assert_redirected_to units_of_measures_path
  end
end
