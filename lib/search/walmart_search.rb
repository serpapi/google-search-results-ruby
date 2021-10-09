require_relative 'serp_api_search'

# Walmart Search Result for Ruby powered by SerpApi
#
# Search API Usage
#
# ```ruby
# parameter = {
#   query: "search keywords",
#   api_key: "Serp API Key"
# }
#
# search = WalmartSearch.new(parameter)
#
# html_results = search.get_html
# hash_results = search.get_hash
# json_results = search.get_json
#
# ```
# doc: https://serpapi.com/youtube-search-api

class WalmartSearch < SerpApiSearch

  def initialize(params = {})
    super(params, WALMART_ENGINE)
    check_params([:query, :engine])
  end

  def get_location
    raise 'location is not supported by Walmart'
  end

end