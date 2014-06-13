require 'test_helper'

class CommoditiesControllerTest < ActionController::TestCase
  setup do
    @commodity = commodities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commodities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commodity" do
    assert_difference('Commodity.count') do
      post :create, commodity: { description: @commodity.description, user_id: @commodity.user_id }
    end

    assert_redirected_to commodity_path(assigns(:commodity))
  end

  test "should show commodity" do
    get :show, id: @commodity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commodity
    assert_response :success
  end

  test "should update commodity" do
    patch :update, id: @commodity, commodity: { description: @commodity.description, user_id: @commodity.user_id }
    assert_redirected_to commodity_path(assigns(:commodity))
  end

  test "should destroy commodity" do
    assert_difference('Commodity.count', -1) do
      delete :destroy, id: @commodity
    end

    assert_redirected_to commodities_path
  end
end
