require_relative 'serp_api_client'

# Yahoo Search Result for Ruby powered by SerpApi
#
# Search API Usage
#
# ```ruby
# parameter = {
#   p: "query",
#   api_key: "Your SERP API Key"
# }
#
# client = YahooSearchResults.new(parameter)
# client.params[:yahoo_domain] = "fr"
#
# html_results = client.get_html
# hash_results = client.get_hash
# json_results = client.get_json
#
# ```
#
# doc: https://serpapi.com/yahoo-search-api

class YahooSearchResults < SerpApiClient

  def initialize(params = {})
    super(params, YAHOO_ENGINE)
    check_params([:p, :engine])
  end

  def get_location
    raise 'location is not supported by ' + YAHOO_ENGINE
  end

end