require_relative 'serp_api_client'

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
# client = YandexSearchResults.new(parameter)
# client.params[:yandex_domain] = "yandex.com"
#
# html_results = client.get_html
# hash_results = client.get_hash
# json_results = client.get_json
#
# ```
#
# doc: https://serpapi.com/yandex-search-api

class YandexSearchResults < SerpApiClient

  def initialize(params = {})
    super(params, YANDEX_ENGINE)
    check_params([:text, :engine])
  end

  def get_location
    raise 'location is not supported by ' + YAHOO_ENGINE
  end

end