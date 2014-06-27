json.array!(@project_detail_strings) do |project_detail_string|
  json.extract! project_detail_string, :id, :user_id, :project_id, :project_category_id, :value
  json.url project_detail_string_url(project_detail_string, format: :json)
end
