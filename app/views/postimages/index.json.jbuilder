json.array!(@postimages) do |postimage|
  json.extract! postimage, :id, :name
  json.url postimage_url(postimage, format: :json)
end
