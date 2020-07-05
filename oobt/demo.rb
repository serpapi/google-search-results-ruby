require 'google_search_results' 

raise 'API_KEY environment variable must be set' if ENV['API_KEY'].nil?

params = {
  engine: "google_autocomplete",
  q: "coffee",
  client: "safari",
  hl: "en",
  gl: "us",
  api_key: ENV['API_KEY']
}

client = GoogleSearchResults.new(params)
suggestions = client.get_hash[:suggestions]

pp suggestions
puts "demo passed"
exit 0