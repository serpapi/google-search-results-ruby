require_relative 'serp_api_search'

# Baidu Search Result for Ruby powered by SerpApi
#
# @example Search API Usage
#   parameter = {
#     q: "query",
#     api_key: "Serp API Key"
#   }
#
#   search = BaiduSearch.new(parameter)
#
#   html_results = search.get_html
#   hash_results = search.get_hash
#   json_results = search.get_json
#
# doc: https://serpapi.com/baidu-search-api

class BaiduSearch < SerpApiSearch

  def initialize(params = {})
    super(params, BAIDU_ENGINE)
  end

  def get_location
    raise SerpApiException.new('location is not supported by Baidu')
  end

end
