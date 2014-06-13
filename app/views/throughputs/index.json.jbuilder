json.array!(@throughputs) do |throughput|
  json.extract! throughput, :id, :user_id, :unit_id, :metric_id, :amount_unit_id, :time_unit_id, :commodity_id, :active_date
  json.url throughput_url(throughput, format: :json)
end
