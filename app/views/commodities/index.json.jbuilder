json.array!(@commodities) do |commodity|
  json.extract! commodity, :id, :user_id, :description
  json.url commodity_url(commodity, format: :json)
end
