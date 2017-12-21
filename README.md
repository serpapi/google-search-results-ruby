# Google Search Results in Ruby

[![Gem Version](https://badge.fury.io/rb/google_search_results.svg)](https://rubygems.org/gems/google_search_results/)
[![Build Status](https://travis-ci.org/serpapi/google_search_results.svg?branch=master)](https://travis-ci.org/serpapi/google_search_results)

This Ruby Gem is meant to scrape and parse Google results using [SERP API](https://serpapi.com). Feel free to fork this repository to add more backends.

## Simple Example

    query = GoogleSearchResults.new q: "coffee"
    hash_results = query.get_hash

## Set SERP API key

    GoogleSearchResults.serp_api_key = "Your Private Key"
Or

    query = GoogleSearchResults.new q: "coffee", serp_api_key: "Your Private Key"
    
## Example with all params and all outputs

    query_params = {
      q: "query",
      google_domain: "Google Domain", 
      location: "Location Requested", 
      device: device,
      hl: "Google UI Language",
      gl: "Google Country",
      num: "Number of Results",
      serp_api_key: "Your SERP API Key"
    }
    query = GoogleSearchResults.new query_params
    hash_results = query.get_hash
    html_results = query.get_html
    json_results = query.get_json
    
    
