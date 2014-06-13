json.array!(@measure_types) do |measure_type|
  json.extract! measure_type, :id, :user_id, :description
  json.url measure_type_url(measure_type, format: :json)
end
