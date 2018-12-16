# Google Search Results in Ruby

[![Gem Version](https://badge.fury.io/rb/google_search_results.svg)](https://rubygems.org/gems/google_search_results/)
[![Build Status](https://travis-ci.org/serpapi/google-search-results-ruby.svg?branch=master)](https://travis-ci.org/serpapi/google-search-results-ruby)

This Ruby Gem is meant to scrape and parse Google results using [SerpApi](https://serpapi.com).

[The full documentation is available here.](https://serpapi.com/search-api)

  Feel free to fork this repository to add more backends.

## Installation

Ruby 1.9+ must be already installed:

```bash
$ gem install google_search_results
```

[Link to the gem page](https://rubygems.org/gems/google_search_results/)

## Simple Example

```ruby
require 'google_search_results'
query = GoogleSearchResults.new(q: "coffee")
hash_results = query.get_hash
 ```

## Set SERP API key

```ruby
GoogleSearchResults.serp_api_key = "Your Private Key"
```
Or
```ruby
query = GoogleSearchResults.new(q: "coffee", serp_api_key: "Your Private Key")
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
  serp_api_key: "Your SERP API Key",
  tbs: "nws|isch|shop"
}

query = GoogleSearchResults.new(query_params)
query.params[:location] = "Portland"

html_results = query.get_html
hash_results = query.get_hash
json_results = query.get_json
```

This service supports Google Images, News, Shopping.
To enable a type of search, the field tbm (to be matched) must be set to:

 * isch: Google Images API.
 * nws: Google News API.
 * shop: Google Shopping API.
 * any other Google service should work out of the box.
 * (no tbm parameter): regular Google Search.

[The full documentation is available here.](https://serpapi.com/search-api)

## Contributing

Contributions are welcome, feel to submit a pull request!

To run the tests:

```bash
rake test
```
