# Google Search Results in Ruby

[![Gem Version](https://badge.fury.io/rb/google_search_results.svg)](https://rubygems.org/gems/google_search_results/)
[![Build Status](https://travis-ci.org/serpapi/google-search-results-ruby.svg?branch=master)](https://travis-ci.org/serpapi/google-search-results-ruby)

This Ruby Gem is meant to scrape and parse Google results using [SerpApi](https://serpapi.com).
The following services are provided:
 * [Search API](https://serpapi.com/search-api)
 * [Location API](https://serpapi.com/locations-api)
 * [Search Archive API](https://serpapi.com/search-archive-api)
 * [Account API](https://serpapi.com/account-api)

Serp API provides a [script builder](https://serpapi.com/demo) to get you started quickly.

Feel free to fork this repository to add more backends.

## Installation

Ruby 2.1+ must be already installed:

```bash
$ gem install google_search_results
```

[Link to the gem page](https://rubygems.org/gems/google_search_results/)

## Quick start

```ruby
require 'google_search_results'
query = GoogleSearchResults.new(q: "coffee", serp_api_key: "secret_api_key" )
hash_results = query.get_hash
 ```

This example runs a search about "coffee" using your secret api key.

The Serp API service (backend)
 - searches on Google using the query: q = "coffee"
 - parses the messy HTML responses
 - return a standardizes JSON response
The Ruby class GoogleSearchResults
 - Format the request to Serp API server
 - Execute GET http request
 - Parse JSON into Ruby Hash using JSON standard library provided by Ruby
Et voila..

## Example
 * [How to set SERP API key](#how-to-set-serp-api-key)
 * [Search API capability](#search-api-capability)
 * [Example by tests] (#example-by-tests)

### How to set SERP API key
The Serp API key can be set globally using a singleton pattern.
```ruby
GoogleSearchResults.serp_api_key = "secret_api_key"
query = GoogleSearchResults.new(q: "coffee")
```

The Serp API key can be provided for each query.
```ruby
query = GoogleSearchResults.new(q: "coffee", serp_api_key: "secret_api_key")
```

### Search API
```ruby
query_params = {
  q: "query",
  google_domain: "Google Domain", 
  location: "Location Requested", 
  device: "desktop|mobile|tablet",
  hl: "Google UI Language",
  gl: "Google Country",
  safe: "Safe Search Flag",
  num: "Number of Results",
  start: "Pagination Offset",
  serp_api_key: "Your SERP API Key",
  tbm: "nws|isch|shop"
  tbs: "custom to be search criteria"
}

# define the search query
query = GoogleSearchResults.new(query_params)

# override an existing parameter
query.params[:location] = "Portland"

# search format return as raw html
html_results = query.get_html

# search format returns a Hash
hash_results = query.get_hash

# search as raw JSON format
json_results = query.get_json
```

### Example by tests

We love true open source, continuous integration and Test Drive Development (TDD). 
 We are using RSpec to test [our infrastructure around the clock](https://travis-ci.org/serpapi/google-search-results-ruby) to achieve the best QoS (Quality Of Service).
 
The directory test/ includes specification/examples.

Install RSpec
```gem install rspec``

To run the test:
```rspec``

### Location API

```ruby
location_list = GoogleSearchResults.new(q: "Austin", limit: 3).get_location
pp location_list
```
it prints the first 3 location matching Austin (Texas, Texas, Rochester)
```
[{:id=>"585069bdee19ad271e9bc072",
  :google_id=>200635,
  :google_parent_id=>21176,
  :name=>"Austin, TX",
  :canonical_name=>"Austin,TX,Texas,United States",
  :country_code=>"US",
  :target_type=>"DMA Region",
  :reach=>5560000,
  :gps=>[-97.7430608, 30.267153],
  :keys=>["austin", "tx", "texas", "united", "states"]},
  ...]
```

### Search Archive API

Let's run a search to get a search_id.
```ruby
gsr = GoogleSearchResults.new(q: "Coffee", location: "Portland")
original_search = gsr.get_hash
search_id = original_search[:search_metadata][:id]

Now let retrieve the previous search from the archieve.
```ruby
gsr = GoogleSearchResults.new
archive_search = gsr.get_search_archive(search_id)
pp archive_search
```
it prints the archive search.

### Account API
```ruby
gsr = GoogleSearchResults.new
pp gsr.get_account
```
it prints the account information.

## More search
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
