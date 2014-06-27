require 'test_helper'

class ProjectDetailStringsControllerTest < ActionController::TestCase
  setup do
    @project_detail_string = project_detail_strings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_detail_strings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_detail_string" do
    assert_difference('ProjectDetailString.count') do
      post :create, project_detail_string: { project_category_id: @project_detail_string.project_category_id, project_id: @project_detail_string.project_id, user_id: @project_detail_string.user_id, value: @project_detail_string.value }
    end

    assert_redirected_to project_detail_string_path(assigns(:project_detail_string))
  end

  test "should show project_detail_string" do
    get :show, id: @project_detail_string
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_detail_string
    assert_response :success
  end

  test "should update project_detail_string" do
    patch :update, id: @project_detail_string, project_detail_string: { project_category_id: @project_detail_string.project_category_id, project_id: @project_detail_string.project_id, user_id: @project_detail_string.user_id, value: @project_detail_string.value }
    assert_redirected_to project_detail_string_path(assigns(:project_detail_string))
  end

  test "should destroy project_detail_string" do
    assert_difference('ProjectDetailString.count', -1) do
      delete :destroy, id: @project_detail_string
    end

    assert_redirected_to project_detail_strings_path
  end
end
