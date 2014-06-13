require 'test_helper'

class ThroughputMetricsControllerTest < ActionController::TestCase
  setup do
    @throughput_metric = throughput_metrics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:throughput_metrics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create throughput_metric" do
    assert_difference('ThroughputMetric.count') do
      post :create, throughput_metric: { description: @throughput_metric.description, user_id: @throughput_metric.user_id }
    end

    assert_redirected_to throughput_metric_path(assigns(:throughput_metric))
  end

  test "should show throughput_metric" do
    get :show, id: @throughput_metric
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @throughput_metric
    assert_response :success
  end

  test "should update throughput_metric" do
    patch :update, id: @throughput_metric, throughput_metric: { description: @throughput_metric.description, user_id: @throughput_metric.user_id }
    assert_redirected_to throughput_metric_path(assigns(:throughput_metric))
  end

  test "should destroy throughput_metric" do
    assert_difference('ThroughputMetric.count', -1) do
      delete :destroy, id: @throughput_metric
    end

    assert_redirected_to throughput_metrics_path
  end
end
