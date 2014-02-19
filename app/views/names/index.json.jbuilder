json.array!(@names) do |name|
  json.extract! name, :id, :nameable_id, :nameable_type, :user_id, :active_date, :name
  json.url name_url(name, format: :json)
end
