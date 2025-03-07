require_relative 'serp_api_search'

# Walmart Search Result for Ruby powered by SerpApi
#
# @example Search API Usage
#   parameter = {
#     query: "search keywords",
#     api_key: "Serp API Key"
#   }
#
#   search = WalmartSearch.new(parameter)
#
#   html_results = search.get_html
#   hash_results = search.get_hash
#   json_results = search.get_json
#
# doc: https://serpapi.com/youtube-search-api

class WalmartSearch < SerpApiSearch

  def initialize(params = {})
    super(params, WALMART_ENGINE)
  end

  def get_location
    raise SerpApiException.new('location is not supported by Walmart')
  end

end
