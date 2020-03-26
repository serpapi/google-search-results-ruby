require 'open-uri'
require 'json'

GOOGLE_ENGINE = 'google'
BAIDU_ENGINE = 'baidu'
BING_ENGINE = 'bing'
YAHOO_ENGINE = 'yahoo'
YANDEX_ENGINE = 'yandex'
EBAY_ENGINE = 'ebay'


# Generic serpapi.com client
#  which allow to custom cutting edge search service
#   by setting the engine paremeter.
class SerpApiClient

  VERSION = "1.4.0"
  BACKEND = "serpapi.com"

  attr_accessor :params

  # constructor
  #
  # Usage
  # ---
  #
  # ```ruby
  # require 'google_search_results'
  # client = SerpApiClient.new({q: "coffee", api_key: "secure API key"}, "google")
  # result = client.get_json
  # ```
  #
  # @param [Hash] params contains requested parameter
  # @param [String] engine google|baidu|google|bing|ebay|yandex
  def initialize(params, engine)
    @params = params
    @params[:engine] ||= engine
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
  def get_hash
    JSON.parse(get_json, {symbolize_names: true})
  end

  # alias for get_hash
  # @deprecated
  def get_hash_with_images
    get_hash
  end

  # alias for get_json
  # @deprecated
  def get_json_with_images
    get_json
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

  # @return [String] current search engine
  def engine
    @params[:engine]
  end

  def construct_url(path)
    @params[:source] = "ruby"
    if !$serp_api_key.nil?
      @params[:api_key] = $serp_api_key
    end

    @params.delete_if { |key, value| value.nil? }

    URI::HTTPS.build(host: BACKEND, path: path, query: URI.encode_www_form(@params))
  end

  # serp_api_key
  # legacy implementation.
  #
  # @param [String] api_key set user secret API key (copy/paste from https://serpapi.com/dashboard)
  def self.serp_api_key=(api_key)
    self.api_key = api_key
  end

  # api_key
  # @param [String] api_key set user secret API key (copy/paste from https://serpapi.com/dashboard)
  def self.api_key=(api_key)
    $serp_api_key = api_key
  end

  # @return [String] api_key for this client
  def api_key
    @params[:api_key] || @params[:serp_api_key] || $serp_api_key
  end

  private

  def get_results(path)
    begin
      url = construct_url(path)
      open(url, read_timeout: 600).read
    rescue OpenURI::HTTPError => e
      if error = JSON.load(e.io.read)["error"]
        puts "server returns error for url: #{url}"
        raise error
      else
        puts "fail: fetch url: #{url}"
        raise e
      end
    rescue => e
      puts "fail: fetch url: #{url}"
      raise e
    end
  end

  def check_params(keys = [])
    return if @params.keys == [:engine]

    raise 'keys must be a list of String or Symbol' unless keys.class == Array
    missing = []
    keys.each do |key|
      case key.class.to_s
      when 'String'
        if @params[key].nil? and @params[key.to_sym].nil?
          missing << "#{key}"
        end
      when 'Symbol'
        if @params[key].nil? and @params[key.to_s].nil?
          missing << "#{key}"
        end
      else
        raise 'keys must contains Symbol or String'
      end
    end
    if missing.size > 0
      raise "missing required keys in params.\n #{missing.join(",")}"
    end
  end

end

