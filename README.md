# Google Search Results in Ruby

[![Gem Version](https://badge.fury.io/rb/google_search_results.svg)](https://rubygems.org/gems/google_search_results/)
[![Build Status](https://travis-ci.org/serpapi/google-search-results-ruby.svg?branch=master)](https://travis-ci.org/serpapi/google-search-results-ruby)

This Ruby Gem is meant to scrape and parse Google results using [SERP API](https://serpapi.com). Feel free to fork this repository to add more backends.

## Installation

Assuming Ruby is already installed:

```bash
$ gem install google_search_results
```

## Simple Example

```ruby
require 'google_search_results'
query = GoogleSearchResults.new q: "coffee"
hash_results = query.get_hash
 ```

## Set SERP API key

```ruby
GoogleSearchResults.serp_api_key = "Your Private Key"
```
Or
```ruby
query = GoogleSearchResults.new q: "coffee", serp_api_key: "Your Private Key"
```
## Example with all params and all outputs
```ruby
query_params = {
  q: "query",
  google_domain: "Google Domain", 
  location: "Location Requested", 
  device: device,
  hl: "Google UI Language",
  gl: "Google Country",
  safe: "Safe Search Flag",
  num: "Number of Results",
  start: "Pagination Offset",
  serp_api_key: "Your SERP API Key"
}

query = GoogleSearchResults.new query_params
query.params[:location] = "Portland"

html_results = query.get_html
hash_results = query.get_hash
hash_results_with_images = query.get_hash_with_images
json_results = query.get_json
json_results_with_images = query.get_json_with_images
```

## Contributing

Contributions are welcome, feel to submit a PR!

To run the tests:

```bash
rake test
```
