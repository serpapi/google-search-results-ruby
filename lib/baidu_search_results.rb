require_relative 'serp_api_client'

# Baidu Search Result for Ruby powered by SerpApi
#
# Search API Usage
#
# ```ruby
# parameter = {
#   q: "query",
#   api_key: "Serp API Key"
# }
#
# search = BaiduSearchResults.new(parameter)
#
# html_results = search.get_html
# hash_results = search.get_hash
# json_results = search.get_json
#
# ```
# doc: https://serpapi.com/baidu-search-api

class BaiduSearchResults < SerpApiClient

  def initialize(params = {})
    super(params, BING_ENGINE)
    check_params([:q, :engine])
  end

  def get_location
    raise 'location is not supported by Baidu'
  end

end