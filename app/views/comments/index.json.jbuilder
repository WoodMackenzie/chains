json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :commentable_id, :commentable_type, :comment
  json.url comment_url(comment, format: :json)
end
