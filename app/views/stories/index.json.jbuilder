json.array!(@stories) do |story|
  json.extract! story, :id, :title, :string, :point, :description, :text, :state
  json.url story_url(story, format: :json)
end
