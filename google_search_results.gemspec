require './lib/google_search_results'

Gem::Specification.new do |s|
  s.name        = "google_search_results"
  s.version     = GoogleSearchResults::VERSION
  s.summary     = "Google Search Results via SERP API."
  s.description = "Get Google Search Results via SERP API. Hash, JSON, and HTML format supported."
  s.authors     = ["hartator", "victor"]
  s.email       = "hartator@gmail.com"
  s.files       = ["lib/google_search_results.rb", "lib/bing_search_results.rb", "lib/serp_api_client.rb", "lib/baidu_search_results.rb"]
  s.homepage    = "https://github.com/serpapi/google-search-results-ruby"
  s.license     = "MIT"
  s.required_ruby_version = '>= 1.9.2'
  s.add_development_dependency 'rake', '~> 10.2'
  s.add_development_dependency 'rspec', '~> 3.8'
  s.metadata["yard.run"] = "yri"
end

