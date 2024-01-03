json.extract! search, :id, :query, :count, :user_id, :created_at, :updated_at
json.url search_url(search, format: :json)
