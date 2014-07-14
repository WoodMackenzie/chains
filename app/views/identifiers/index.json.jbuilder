json.array!(@identifiers) do |identifier|
  json.extract! identifier, :id, :user_id, :identifier_type_id, :value
  json.url identifier_url(identifier, format: :json)
end
