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
# search = YahooSearchResults.new(parameter)
# search.params[:yahoo_domain] = "fr"
#
# html_results = search.get_html
# hash_results = search.get_hash
# json_results = search.get_json
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