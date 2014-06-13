json.array!(@throughput_metrics) do |throughput_metric|
  json.extract! throughput_metric, :id, :user_id, :description
  json.url throughput_metric_url(throughput_metric, format: :json)
end
