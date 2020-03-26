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
# client = BaiduSearchResults.new(parameter)
#
# html_results = client.get_html
# hash_results = client.get_hash
# json_results = client.get_json
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