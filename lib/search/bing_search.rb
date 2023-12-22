require_relative 'serp_api_search'

# Bing Search Result for Ruby powered by SerpApi
#
# @example Search API Usage
#   parameter = {
#     q: "query",
#     location: "city,state,country",
#     api_key: "Your SERP API Key"
#   }
#
#   search = BingSearch.new(parameter)
#   search.params[:location] = "Portland"
#
#   html_results = search.get_html
#   hash_results = search.get_hash
#   json_results = search.get_json
# 
# doc: https://serpapi.com/bing-search-api

class BingSearch < SerpApiSearch

  def initialize(params = {})
    super(params, BING_ENGINE)
    check_params([:q, :engine])
  end

end
