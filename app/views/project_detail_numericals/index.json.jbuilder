json.array!(@project_detail_numericals) do |project_detail_numerical|
  json.extract! project_detail_numerical, :id, :user_id, :project_id, :project_category_id, :value, :units_of_measure_id
  json.url project_detail_numerical_url(project_detail_numerical, format: :json)
end
