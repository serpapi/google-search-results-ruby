# Google Search Result for Ruby powered by SerpAPI
#
# Search API Usage
# ```
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
#   serp_api_key: "Your SERP API Key"
# }
#
# gsr = GoogleSearchResults.new(parameter)
# gsr.params[:location] = "Portland"
#
# html_results = gsr.get_html
# hash_results = gsr.get_hash
# json_results = gsr.get_json
# ```
# encoding: UTF-8

require 'open-uri'
require 'json'

class GoogleSearchResults

  VERSION = "1.2.0"
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
  # gsr = GoogleSearchResults.new({q: "coffee", serp_api_key: "Your SERP API Key")
  # result = gsr.get_json```
  #
  def initialize(params = {})
    @params = params
  end

  # get_json 
  # @return [Hash] search result "json like"
  #  where keys are String
  def get_json
    @params[:output] = "json"
    get_results('/search')
  end

  # get_html 
  # @return [String] raw html
  def get_html
    @params[:output] = "html"
    get_results('/search')
  end

  # get_html
  # @return [Hash] search result Ruby hash
  #  where keys are Symbol
  def get_hash()
    JSON.parse(get_json, {symbolize_names: true})
  end

  # Get location using Location API
  def get_location
    JSON.parse(get_results('/locations.json'), {symbolize_names: true})
  end

  # Retrieve search result from the Search Archive API
  def get_search_archive(search_id, format = 'json')
    raise 'format must be json or html' if format !~ /^(html|json)$/
    JSON.parse(get_results("/searches/#{search_id}.#{format}"), {symbolize_names: true})
  end

   # Get account information using Account API
   def get_account
    JSON.parse(get_results('/account'), {symbolize_names: true})
  end

  def construct_url(path)
    @params[:source] = "ruby"
    if GoogleSearchResults.serp_api_key
      @params[:serp_api_key] ||= GoogleSearchResults.serp_api_key
    end
    if @params[:serp_api_key].nil?
      @params.delete(:serp_api_key)
    end

    URI::HTTPS.build(host: BACKEND, path: path, query: URI.encode_www_form(@params))
  end

  private

  def get_results(path)
    begin
      open(construct_url(path), read_timeout: 600).read
    rescue OpenURI::HTTPError => e
      if error = JSON.load(e.io.read)["error"]
        raise error
      else
        raise e
      end
    end
  end

end

