json.array!(@units_of_measures) do |units_of_measure|
  json.extract! units_of_measure, :id, :user_id, :description, :measure_type_id
  json.url units_of_measure_url(units_of_measure, format: :json)
end
