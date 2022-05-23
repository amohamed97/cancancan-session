json.extract! post, :id, :title, :body, :user_id, :is_public, :is_approved, :created_at, :updated_at
json.url post_url(post, format: :json)
