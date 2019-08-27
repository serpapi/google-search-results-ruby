require_relative '../lib/bing_search_results'

# Bing Search Result for Ruby powered by SerpAPI
#
# Search API Usage
# ```
# parameter = {
#   q: "query",
#   location: "city,state,country",
#   api_key: "Your SERP API Key"
# }
#
# client = BingSearchResults.new(parameter)
# client.params[:location] = "Portland"
#
# html_results = client.get_html
# hash_results = client.get_hash
# json_results = client.get_json
# ```
# 
# doc: https://serpapi.com/bing-search-api

class BingSearchResults < SerpApiClient

  def initialize(params = {})
    super(params, BING_ENGINE)
  end

end