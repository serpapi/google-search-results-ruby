require_relative 'serp_api_search'

# Duckduckgo Search Result for Ruby powered by SerpApi
#
# Search API Usage
#
# ```ruby
# parameter = {
#   search_query: "query",
#   api_key: "Serp API Key"
# }
#
# search = DuckduckgoSearch.new(parameter)
#
# html_results = search.get_html
# hash_results = search.get_hash
# json_results = search.get_json
#
# ```
# doc: https://serpapi.com/Duckduckgo-search-api

class DuckduckgoSearch < SerpApiSearch

  def initialize(params = {})
    super(params, DUCKDUCKGO_ENGINE)
    check_params([:q, :engine])
  end

end