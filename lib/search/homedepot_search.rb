require_relative 'serp_api_search'

# Homedepot Search Result for Ruby powered by SerpApi
#
# Search API Usage
#
# ```ruby
# parameter = {
#   search_query: "query",
#   api_key: "Serp API Key"
# }
#
# search = HomedepotSearch.new(parameter)
#
# html_results = search.get_html
# hash_results = search.get_hash
# json_results = search.get_json
#
# ```
# doc: https://serpapi.com/Homedepot-search-api

class HomedepotSearch < SerpApiSearch

  def initialize(params = {})
    super(params, HOMEDEPOT_ENGINE)
    check_params([:q, :engine])
  end

  def get_location
    raise 'location is not supported by Homedepot'
  end

end