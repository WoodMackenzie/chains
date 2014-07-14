require 'test_helper'

class IdentifierTypesControllerTest < ActionController::TestCase
  setup do
    @identifier_type = identifier_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:identifier_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create identifier_type" do
    assert_difference('IdentifierType.count') do
      post :create, identifier_type: { user_id: @identifier_type.user_id, value: @identifier_type.value }
    end

    assert_redirected_to identifier_type_path(assigns(:identifier_type))
  end

  test "should show identifier_type" do
    get :show, id: @identifier_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @identifier_type
    assert_response :success
  end

  test "should update identifier_type" do
    patch :update, id: @identifier_type, identifier_type: { user_id: @identifier_type.user_id, value: @identifier_type.value }
    assert_redirected_to identifier_type_path(assigns(:identifier_type))
  end

  test "should destroy identifier_type" do
    assert_difference('IdentifierType.count', -1) do
      delete :destroy, id: @identifier_type
    end

    assert_redirected_to identifier_types_path
  end
end
