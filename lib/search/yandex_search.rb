require_relative 'serp_api_search'

# Yandex Search Result for Ruby powered by SerpApi
#
# Search API Usage
#
# ```ruby
# parameter = {
#   text: "query",
#   api_key: "Your SERP API Key"
# }
#
# search = YandexSearch.new(parameter)
# search.params[:yandex_domain] = "yandex.com"
#
# html_results = search.get_html
# hash_results = search.get_hash
# json_results = search.get_json
#
# ```
#
# doc: https://serpapi.com/yandex-search-api

class YandexSearch < SerpApiSearch

  def initialize(params = {})
    super(params, YANDEX_ENGINE)
    check_params([:text, :engine])
  end

  def get_location
    raise 'location is not supported by ' + YAHOO_ENGINE
  end

end