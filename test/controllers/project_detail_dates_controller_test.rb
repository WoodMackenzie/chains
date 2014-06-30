require 'test_helper'

class ProjectDetailDatesControllerTest < ActionController::TestCase
  setup do
    @project_detail_date = project_detail_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_detail_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_detail_date" do
    assert_difference('ProjectDetailDate.count') do
      post :create, project_detail_date: { project_category_id: @project_detail_date.project_category_id, project_id: @project_detail_date.project_id, user_id: @project_detail_date.user_id, value: @project_detail_date.value }
    end

    assert_redirected_to project_detail_date_path(assigns(:project_detail_date))
  end

  test "should show project_detail_date" do
    get :show, id: @project_detail_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_detail_date
    assert_response :success
  end

  test "should update project_detail_date" do
    patch :update, id: @project_detail_date, project_detail_date: { project_category_id: @project_detail_date.project_category_id, project_id: @project_detail_date.project_id, user_id: @project_detail_date.user_id, value: @project_detail_date.value }
    assert_redirected_to project_detail_date_path(assigns(:project_detail_date))
  end

  test "should destroy project_detail_date" do
    assert_difference('ProjectDetailDate.count', -1) do
      delete :destroy, id: @project_detail_date
    end

    assert_redirected_to project_detail_dates_path
  end
end
