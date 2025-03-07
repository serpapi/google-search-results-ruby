require_relative 'serp_api_search'

# Yahoo Search Result for Ruby powered by SerpApi
#
# @example Search API Usage
#   parameter = {
#     p: "query",
#     api_key: "Your SERP API Key"
#   }
#
#   search = YahooSearch.new(parameter)
#   search.params[:yahoo_domain] = "fr"
#
#   html_results = search.get_html
#   hash_results = search.get_hash
#   json_results = search.get_json
#
# doc: https://serpapi.com/yahoo-search-api

class YahooSearch < SerpApiSearch

  def initialize(params = {})
    super(params, YAHOO_ENGINE)
  end

  def get_location
    raise SerpApiException.new('location is not supported by ' + YAHOO_ENGINE)
  end

end
