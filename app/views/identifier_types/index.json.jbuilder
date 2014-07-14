json.array!(@identifier_types) do |identifier_type|
  json.extract! identifier_type, :id, :user_id, :value
  json.url identifier_type_url(identifier_type, format: :json)
end
