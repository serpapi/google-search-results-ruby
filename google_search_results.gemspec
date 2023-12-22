require_relative 'lib/search/serp_api_search'

Gem::Specification.new do |s|
  s.name        = "google_search_results"
  s.version     = SerpApiSearch::VERSION
  s.summary     = "Official client for SerpApi.com - scrape search results from multiple search engines."
  s.description = "Integrate search data into your Ruby application. This library is the official wrapper for SerpApi.com. SerpApi supports Google, Google Maps, Google Shopping, Baidu, Yandex, Yahoo, eBay, App Stores, and more."
  s.authors     = ["hartator", "jvmvik"]
  s.email       = "hartator@gmail.com"
  s.files       = [ "README.md", "lib/google_search_results.rb"] + Dir.glob("lib/search/*.rb")
  s.homepage    = "https://github.com/serpapi/google-search-results-ruby"
  s.license     = "MIT"
  s.required_ruby_version = '>= 1.9.2'
  s.add_development_dependency 'rake', '~> 13.0.1'
  s.add_development_dependency 'rspec', '~> 3.9'
  s.add_development_dependency 'yard', '~> 0.9.24'
  s.add_development_dependency 'rubocop', '~> 0.49.1'
  s.metadata["yard.run"] = "yri"
end

