json.array!(@project_detail_dates) do |project_detail_date|
  json.extract! project_detail_date, :id, :user_id, :project_id, :project_category_id, :value
  json.url project_detail_date_url(project_detail_date, format: :json)
end
