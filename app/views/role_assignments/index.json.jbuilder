json.array!(@role_assignments) do |role_assignment|
  json.extract! role_assignment, :id
  json.url role_assignment_url(role_assignment, format: :json)
end
