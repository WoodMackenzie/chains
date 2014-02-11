json.array!(@processing_units) do |processing_unit|
  json.extract! processing_unit, :id, :name, :comment
  json.url processing_unit_url(processing_unit, format: :json)
end
