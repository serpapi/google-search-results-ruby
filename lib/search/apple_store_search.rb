require_relative 'serp_api_search'

# Apple Store Search Result for Ruby powered by SerpApi
#
# @example Search API Usage
#   parameter = {
#     term: "laptop",
#     api_key: "Your SERP API Key"
#   }
#
#   search = AppleStoreSearch.new(parameter)
#
#   html_results = search.get_html
#   hash_results = search.get_hash
#   json_results = search.get_json
# 
# doc: https://serpapi.com/bing-search-api

class AppleStoreSearch < SerpApiSearch

  def initialize(params = {})
    super(params, APPLE_STORE_ENGINE)
  end

  def get_location
    raise SerpApiException.new('location is not supported by ' + APPLE_STORE_ENGINE)
  end

end
