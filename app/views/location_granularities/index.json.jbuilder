json.array!(@location_granularities) do |location_granularity|
  json.extract! location_granularity, :id, :user_id, :description
  json.url location_granularity_url(location_granularity, format: :json)
end
