json.array!(@stories) do |story|
  json.extract! story, :id, :title, :point, :description, :state
  json.url story_url(story, format: :json)
end
