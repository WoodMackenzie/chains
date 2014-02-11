require 'test_helper'

class ProcessingUnitsControllerTest < ActionController::TestCase
  setup do
    @processing_unit = processing_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:processing_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create processing_unit" do
    assert_difference('ProcessingUnit.count') do
      post :create, processing_unit: { comment: @processing_unit.comment, name: @processing_unit.name }
    end

    assert_redirected_to processing_unit_path(assigns(:processing_unit))
  end

  test "should show processing_unit" do
    get :show, id: @processing_unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @processing_unit
    assert_response :success
  end

  test "should update processing_unit" do
    patch :update, id: @processing_unit, processing_unit: { comment: @processing_unit.comment, name: @processing_unit.name }
    assert_redirected_to processing_unit_path(assigns(:processing_unit))
  end

  test "should destroy processing_unit" do
    assert_difference('ProcessingUnit.count', -1) do
      delete :destroy, id: @processing_unit
    end

    assert_redirected_to processing_units_path
  end
end
