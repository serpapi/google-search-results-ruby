require_relative 'serp_api_search'

# Naver Search Result for Ruby powered by SerpApi
#
# @example Search API Usage
#   parameter = {
#     q: "query",
#     location: "city,state,country",
#     api_key: "Your SERP API Key"
#   }
#
#   search = NaverSearch.new(parameter)
#   search.params[:location] = "Portland"
#
#   html_results = search.get_html
#   hash_results = search.get_hash
#   json_results = search.get_json
#
# doc: https://serpapi.com/bing-search-api

class NaverSearch < SerpApiSearch

  def initialize(params = {})
    super(params, NAVER_ENGINE)
  end

  def get_location
    raise SerpApiException.new('location is not supported by ' + NAVER_ENGINE)
  end

end
