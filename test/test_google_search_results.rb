# encoding: UTF-8

require 'minitest/autorun'
require 'google_search_results'

class GoogleSearchResultsTest < Minitest::Test

  def setup
    GoogleSearchResults.serp_api_key = nil
    @query = GoogleSearchResults.new(q: "Coffee", location: "Portland")
  end

  def test_construct_url
    assert_equal "https://serpapi.com/search?q=Coffee&location=Portland&source=ruby", @query.construct_url.to_s
  end

  def test_set_serp_api_key_on_class
    GoogleSearchResults.serp_api_key = "secret_key_from_class"
    assert_includes @query.construct_url.to_s, "secret_key_from_class"
  end

  def test_set_serp_api_key_with_params
    @query.params[:serp_api_key] = "secret_key_from_params"
    assert_includes @query.construct_url.to_s, "secret_key_from_params"
  end

  def test_html_output
    assert_includes @query.get_html, "coffee"
  end

  def test_json_output
    assert_includes @query.get_json, "coffee"
  end

  def test_hash_output
    refute_empty @query.get_hash[:organic_results]
  end

end