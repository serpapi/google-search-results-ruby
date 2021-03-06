require_relative 'lib/search/serp_api_search'

Gem::Specification.new do |s|
  s.name        = "google_search_results"
  s.version     = SerpApiSearch::VERSION
  s.summary     = "Get Google, Bing, Baidu, Ebay, Yahoo, Yandex Search Results via SerpApi.com"
  s.description = "Scape localized search results from search engine using SerpApi.com and returns Hash, JSON, raw HTML"
  s.authors     = ["hartator", "jvmvik"]
  s.email       = "hartator@gmail.com"
  s.files       = [
     "lib/google_search_results.rb",
     "lib/search/serp_api_search.rb",
     "lib/search/google_search.rb",
     "lib/search/bing_search.rb",
     "lib/search/baidu_search.rb",
     "lib/search/yahoo_search.rb",
     "lib/search/yandex_search.rb",
     "lib/search/ebay_search.rb",
    ]
  s.homepage    = "https://github.com/serpapi/google-search-results-ruby"
  s.license     = "MIT"
  s.required_ruby_version = '>= 1.9.2'
  s.add_development_dependency 'rake', '~> 13.0.1'
  s.add_development_dependency 'rspec', '~> 3.9'
  s.add_development_dependency 'yard', '~> 0.9.24'
  s.add_development_dependency 'rubocop', '~> 0.49.1'
  s.metadata["yard.run"] = "yri"
end

