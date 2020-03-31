require './lib/google_search_results'

Gem::Specification.new do |s|
  s.name        = "google_search_results"
  s.version     = SerpApiClient::VERSION
  s.summary     = "Get Google, Bing, Baidu, Ebay, Yahoo, Yandex Search Results via SerpApi.com"
  s.description = "Scape localized search results from search engine using SerpApi.com and returns Hash, JSON, raw HTML"
  s.authors     = ["hartator", "jvmvik"]
  s.email       = "hartator@gmail.com"
  s.files       = [
     "lib/serp_api_client.rb",
     "lib/google_search_results.rb",
     "lib/bing_search_results.rb",
     "lib/baidu_search_results.rb",
     "lib/yahoo_search_results.rb",
     "lib/yandex_search_results.rb",
     "lib/ebay_search_results.rb",
    ]
  s.homepage    = "https://github.com/serpapi/google-search-results-ruby"
  s.license     = "MIT"
  s.required_ruby_version = '>= 1.9.2'
  s.add_development_dependency 'rake', '~> 13.0.1'
  s.add_development_dependency 'rspec', '~> 3.9'
  s.add_development_dependency 'yard', '~> 0.9.24'
  s.add_development_dependency 'rubocop', '~> 0.39.0'
  s.metadata["yard.run"] = "yri"
end

