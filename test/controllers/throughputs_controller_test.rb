require 'test_helper'

class ThroughputsControllerTest < ActionController::TestCase
  setup do
    @throughput = throughputs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:throughputs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create throughput" do
    assert_difference('Throughput.count') do
      post :create, throughput: { active_date: @throughput.active_date, amount_unit_id: @throughput.amount_unit_id, commodity_id: @throughput.commodity_id, metric_id: @throughput.metric_id, time_unit_id: @throughput.time_unit_id, unit_id: @throughput.unit_id, user_id: @throughput.user_id }
    end

    assert_redirected_to throughput_path(assigns(:throughput))
  end

  test "should show throughput" do
    get :show, id: @throughput
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @throughput
    assert_response :success
  end

  test "should update throughput" do
    patch :update, id: @throughput, throughput: { active_date: @throughput.active_date, amount_unit_id: @throughput.amount_unit_id, commodity_id: @throughput.commodity_id, metric_id: @throughput.metric_id, time_unit_id: @throughput.time_unit_id, unit_id: @throughput.unit_id, user_id: @throughput.user_id }
    assert_redirected_to throughput_path(assigns(:throughput))
  end

  test "should destroy throughput" do
    assert_difference('Throughput.count', -1) do
      delete :destroy, id: @throughput
    end

    assert_redirected_to throughputs_path
  end
end
