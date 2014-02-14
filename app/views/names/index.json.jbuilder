json.array!(@names) do |name|
  json.extract! name, :id, :target_id, :target_type, :user_id, :active_date, :name
  json.url name_url(name, format: :json)
end
