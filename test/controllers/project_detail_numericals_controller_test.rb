require 'test_helper'

class ProjectDetailNumericalsControllerTest < ActionController::TestCase
  setup do
    @project_detail_numerical = project_detail_numericals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_detail_numericals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_detail_numerical" do
    assert_difference('ProjectDetailNumerical.count') do
      post :create, project_detail_numerical: { project_category_id: @project_detail_numerical.project_category_id, project_id: @project_detail_numerical.project_id, units_of_measrure_id: @project_detail_numerical.units_of_measrure_id, user_id: @project_detail_numerical.user_id, value: @project_detail_numerical.value }
    end

    assert_redirected_to project_detail_numerical_path(assigns(:project_detail_numerical))
  end

  test "should show project_detail_numerical" do
    get :show, id: @project_detail_numerical
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_detail_numerical
    assert_response :success
  end

  test "should update project_detail_numerical" do
    patch :update, id: @project_detail_numerical, project_detail_numerical: { project_category_id: @project_detail_numerical.project_category_id, project_id: @project_detail_numerical.project_id, units_of_measrure_id: @project_detail_numerical.units_of_measrure_id, user_id: @project_detail_numerical.user_id, value: @project_detail_numerical.value }
    assert_redirected_to project_detail_numerical_path(assigns(:project_detail_numerical))
  end

  test "should destroy project_detail_numerical" do
    assert_difference('ProjectDetailNumerical.count', -1) do
      delete :destroy, id: @project_detail_numerical
    end

    assert_redirected_to project_detail_numericals_path
  end
end
