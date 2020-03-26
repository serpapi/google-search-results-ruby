require_relative 'serp_api_client'

# Google Search Result for Ruby powered by SerpApi
#
# Search API Usage
#
# ```ruby
# parameter = {
#   q: "query",
#   google_domain: "Google Domain", 
#   location: "Location Requested", 
#   device: device,
#   hl: "Google UI Language",
#   gl: "Google Country",
#   safe: "Safe Search Flag",
#   num: "Number of Results",
#   start: "Pagination Offset",
#   tbm: "to be matched field",
#   tbs: "to be searched field",
#   api_key: "Your SERP API Key"
# }
#
# client = GoogleSearchResults.new(parameter)
# client.params[:location] = "Portland"
#
# html_results = client.get_html
# hash_results = client.get_hash
# json_results = client.get_json
#
# ```
#
# doc: https://serpapi.com/search-api

class GoogleSearchResults < SerpApiClient

  def initialize(params = {})
    super(params, GOOGLE_ENGINE)
    check_params([:q, :engine])
  end

end