# Google Search Result for Ruby
#  powered by SerpApi.com
#
# Usage
# ```
#query_params = {
#   q: "query",
#   google_domain: "Google Domain", 
#   location: "Location Requested", 
#   device: device,
#   hl: "Google UI Language",
#   gl: "Google Country",
#   safe: "Safe Search Flag",
#   num: "Number of Results",
#   start: "Pagination Offset",
#   serp_api_key: "Your SERP API Key"
# }
#
# query = GoogleSearchResults.new(query_params)
# query.params[:location] = "Portland"
#
# html_results = query.get_html
# hash_results = query.get_hash
# json_results = query.get_json
# ```
# encoding: UTF-8

require 'open-uri'
require 'json'
require_relative 'google_search_results/hash'

class GoogleSearchResults

  VERSION = "1.1.0"
  BACKEND = "serpapi.com"

  @@serp_api_key = nil

  class << self
    attr_accessor :serp_api_key
  end

  attr_accessor :params

  # constructor
  #
  # Usage
  # ---
  # ```require 'google_search_results'
  # query = GoogleSearchResults.new({q: "coffee", serp_api_key: "Your SERP API Key")
  # result = query.get_json```
  #
  def initialize(params = {})
    @params = params
  end

  # get_json 
  # @return [Hash] search result "json like"
  #  where keys are String
  def get_json
    @params[:output] = "json"
    get_results
  end

  # get_html 
  # @return [String] raw html
  def get_html
    @params[:output] = "html"
    get_results
  end

  # get_html
  # @return [Hash] search result Ruby hash
  #  where keys are Symbol
  def get_hash
    JSON.load(get_json).symbolize_all_keys
  end

  def construct_url
    @params[:source] = "ruby"
    if @params[:serp_api_key].nil? and GoogleSearchResults.serp_api_key
      @params[:serp_api_key] = GoogleSearchResults.serp_api_key
    end
    URI::HTTPS.build(host: BACKEND, path: '/search', query: URI.encode_www_form(@params))
  end

  private

  def get_results
    begin
      open(construct_url, read_timeout: 600).read
    rescue OpenURI::HTTPError => e
      if error = JSON.load(e.io.read)["error"]
        raise error
      else
        raise e
      end
    end
  end

end

