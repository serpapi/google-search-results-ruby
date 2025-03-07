require_relative 'serp_api_search'

# Youtube Search Result for Ruby powered by SerpApi
#
# @example Search API Usage
#   parameter = {
#     search_query: "query",
#     api_key: "Serp API Key"
#   }
#
#   search = YoutubeSearch.new(parameter)
#
#   html_results = search.get_html
#   hash_results = search.get_hash
#   json_results = search.get_json
#
# doc: https://serpapi.com/youtube-search-api

class YoutubeSearch < SerpApiSearch

  def initialize(params = {})
    super(params, YOUTUBE_ENGINE)
  end

end
