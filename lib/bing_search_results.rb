require_relative '../lib/bing_search_results'

# Bing Search Result for Ruby powered by SerpApi
#
# Search API Usage
#
# ```ruby
# parameter = {
#   q: "query",
#   location: "city,state,country",
#   api_key: "Your SERP API Key"
# }
#
# search = BingSearchResults.new(parameter)
# search.params[:location] = "Portland"
#
# html_results = search.get_html
# hash_results = search.get_hash
# json_results = search.get_json
#
# ```
# 
# doc: https://serpapi.com/bing-search-api

class BingSearchResults < SerpApiClient

  def initialize(params = {})
    super(params, BING_ENGINE)
    check_params([:q, :engine])
  end

end