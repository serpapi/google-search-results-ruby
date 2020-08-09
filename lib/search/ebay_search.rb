require_relative 'serp_api_search'

# Ebay Search Result for Ruby powered by SerpApi
#
# Search API Usage
#
# ```ruby
# parameter = {
#   _nkw: "query",
#   api_key: "Your SERP API Key"
# }
#
# search = EbaySearch.new(parameter)
# search.params[:ebay_domain] = "ebay.com"
#
# html_results = search.get_html
# hash_results = search.get_hash
# json_results = search.get_json
#
# ```
#
# doc: https://serpapi.com/ebay-search-api

class EbaySearch < SerpApiSearch

  def initialize(params = {})
    super(params, EBAY_ENGINE)
    check_params([:_nkw, :engine])
  end

  def get_location
    raise 'location is not supported by ' + EBAY_ENGINE
  end

end