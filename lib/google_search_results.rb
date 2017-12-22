# encoding: UTF-8

require 'open-uri'
require 'json'
require_relative 'google_search_results/hash'

class GoogleSearchResults

  VERSION = "0.0.2"
  BACKEND = "serpapi.com"

  @@serp_api_key = nil

  class << self
    attr_accessor :serp_api_key
  end

  attr_accessor :params

  def initialize params
    @params = params
  end

  def construct_url
    @params[:source] = "ruby"
    if @params[:serp_api_key].nil? and GoogleSearchResults.serp_api_key
      @params[:serp_api_key] = GoogleSearchResults.serp_api_key
    end
    URI::HTTPS.build(host: BACKEND, path: '/search', query: URI.encode_www_form(@params))
  end

  def get_html
    @params[:output] = "html"
    open(construct_url).read
  end

  def get_json
    @params[:output] = "json"
    open(construct_url).read
  end

  def get_hash
    JSON.load(get_json).symbolize_all_keys
  end

end 