# Google Search Results in Ruby

[![Gem Version](https://badge.fury.io/rb/google_search_results.svg)](https://rubygems.org/gems/google_search_results/)
[![Build Status](https://travis-ci.org/serpapi/google-search-results-ruby.svg?branch=master)](https://travis-ci.org/serpapi/google-search-results-ruby)

This Ruby Gem is meant to scrape and parse results from Google, Bing or Baidu using [SerpApi](https://serpapi.com).

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
client = GoogleSearchResults.new(q: "coffee", serp_api_key: "secret_api_key" )
hash_results = client.get_hash
 ```

This example runs a search about "coffee" using your secret api key.

The Serp API service (backend)
 - searches on Google using the client: q = "coffee"
 - parses the messy HTML responses
 - return a standardizes JSON response
The Ruby class GoogleSearchResults
 - Format the request to Serp API server
 - Execute GET http request
 - Parse JSON into Ruby Hash using JSON standard library provided by Ruby
Et voila..

## Example with Google
 * [How to set SERP API key](#how-to-set-serp-api-key)
 * [Search API capability](#search-api-capability)
 * [Example by specification](#example-by-specification)
 * [Location API](#location-api)
 * [Search Archive API](#search-archive-api)
 * [Account API](#account-api)
 * [Search Google Images](#search-google-images)
 * [Search Google News](#search-google-news)
 * [Search Google Shopping](#search-google-shopping)
 * [Google Search By Location](#google-search-by-location)
 * [Batch Asynchronous search](#batch-asynchronous-search)

## Bing search
 * [Bing search API](#bing-search-api)

## Baidu search
 * [Baidu search API](#baidu-search-api)


### How to set SERP API key
The Serp API key can be set globally using a singleton pattern.
```ruby
GoogleSearchResults.serp_api_key = "secret_api_key"
client = GoogleSearchResults.new(q: "coffee")
```

The Serp API key can be provided for each client.
```ruby
client = GoogleSearchResults.new(q: "coffee", serp_api_key: "secret_api_key")
```

### Search API capability
```ruby
client_params = {
  q: "client",
  google_domain: "Google Domain", 
  location: "Location Requested", 
  device: "desktop|mobile|tablet",
  hl: "Google UI Language",
  gl: "Google Country",
  safe: "Safe Search Flag",
  num: "Number of Results",
  start: "Pagination Offset",
  api_key: "Your SERP API Key", # copy paste from https://serpapi.com/dashboard
  tbm: "nws|isch|shop",
  tbs: "custom to be search criteria"
  async: true|false # allow async
}

# define the search client
client = GoogleSearchResults.new(client_params)

# override an existing parameter
client.params[:location] = "Portland,Oregon,United States"

# search format return as raw html
html_results = client.get_html

# search format returns a Hash
hash_results = client.get_hash

# search as raw JSON format
json_results = client.get_json
```

(the full documentation)[https://serpapi.com/search-api]

see below for more hands on examples.

### Example by specification

We love true open source, continuous integration and Test Drive Development (TDD). 
 We are using RSpec to test [our infrastructure around the clock](https://travis-ci.org/serpapi/google-search-results-ruby) to achieve the best QoS (Quality Of Service).
 
The directory test/ includes specification/examples.

Set your api key.
```bash
export API_KEY="your secret key"
```

Install RSpec
```gem install rspec```

To run the test:
```rspec test```

or if you prefers Rake
```rake test```

### Location API

```ruby
location_list = GoogleSearchResults.new(q: "Austin", limit: 3).get_location
pp location_list
```

it prints the first 3 location matching Austin (Texas, Texas, Rochester)
```ruby
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


a search to get a search_id.
```ruby
client = GoogleSearchResults.new(q: "Coffee", location: "Portland")
original_client = client.get_hash
search_id = original_search[:search_metadata][:id]
```

Now let retrieve the previous search from the archive.

```ruby
client = GoogleSearchResults.new
archive_client = client.get_search_archive(search_id)
pp archive_search
```
it prints the search from the archive.

### Account API
```ruby
client = GoogleSearchResults.new
pp client.get_account
```
it prints your account information.

### Search Google Images

```ruby
client = GoogleSearchResults.new(q: 'cofffe', tbm: "isch")
image_results_list = client.get_hash[:images_results]
image_results_list.each do |image_result|
  puts image_result[:original]
  # to download the image:
  # `wget #{image_result[:original]}`
end
```

this code prints all the images links, 
 and download image if you un-comment the line with wget (linux/osx tool to download image).

### Search Google News

```ruby
client = GoogleSearchResults.new({
  q: 'cofffe', # search client
  tbm: "nws", # news
  tbs: "qdr:d", # last 24h
  num: 10
})

3.times do |offset|
  client.params[:start] = offset * 10
  news_results_list = client.get_hash[:news_results]
  news_results_list.each do |news_result|
    puts "#{news_result[:position] + offset * 10} - #{news_result[:title]}"
  end
end
```

this script prints the first 3 pages of the news title for the last 24h.

### Search Google Shopping

```ruby
client = GoogleSearchResults.new({
  q: 'cofffe', # search client
  tbm: "shop", # shopping
  tbs: "tbs=p_ord:rv" # by best review
})
shopping_results_list = client.get_hash[:shopping_results]
shopping_results_list.each do |shopping_result|
  puts "#{shopping_result[:position]} - #{shopping_result[:title]}"
end
```

this script prints all the shopping results order by review order with position.

### Google Search By Location

With Serp API, we can build Google search from anywhere in the world.
This code is looking for the best coffee shop per city.

```ruby
["new york", "paris", "berlin"].each do |city|
    # get location from the city name
    location = GoogleSearchResults.new({q: city, limit: 1}).get_location.first[:canonical_name]

    # get top result
    client = GoogleSearchResults.new({
      q: 'best coffee shop', 
      location: location,
      num: 1,  # number of result
      start: 0 # offset
    })
    top_result = client.get_hash[:organic_results].first

    puts "top coffee result for #{location} is: #{top_result[:title]}"
  end
```

### Batch Asynchronous search

We do offer two ways to boost your searches thanks to `async` parameter.
 - Non-blocking - async=true  (recommended)
 - Blocking - async=false - it's more compute intensive because the client would need to hold many connections.

```ruby
company_list = %w(microsoft apple nvidia)

puts "submit batch of asynchronous searches"
client = GoogleSearchResults.new({async: true})

search_queue = Queue.new
company_list.each do |company|
  # set client
  client.params[:q] = company

  # store request into a search_queue - no-blocker
  search = client.get_hash()
  if search[:search_metadata][:status] =~ /Cached|Success/
    puts "#{company}: search done"
    next
  end

  # add result to the search queue
  search_queue.push(search)
end

puts "wait until all searches are cached or success"
client = GoogleSearchResults.new
while !search_queue.empty?
  client = search_queue.pop
  # extract search id
  search_id = search[:search_metadata][:id]

  # retrieve search from the archive - blocker
  search_archived =  client.get_search_archive(search_id)
  if search_archived[:search_metadata][:status] =~ /Cached|Success/
    puts "#{search_archived[:search_parameters][:q]}: search done"
    next
  end

  # add back the search
  search_queue.push(search)
end

search_queue.close
puts 'all searches completed'
  ```
This code shows a simple implementation to run a batch of asynchronously searches.

## Bing search API

```ruby
GoogleSearchResults.serp_api_key = ""
client = GoogleSearchResults.new(q: "Coffee", location: "Portland")
pp client.get_hash
```

## Baidu search API

```ruby
BaiduSearchResults.serp_api_key = ""
client = BaiduSearchResults.new(q: "Coffee")
pp client.get_hash
```

## Conclusion
Serp API supports Google Images, News, Shopping and more..
To enable a type of search, the field tbm (to be matched) must be set to:

 * isch: Google Images API.
 * nws: Google News API.
 * shop: Google Shopping API.
 * any other Google service should work out of the box.
 * (no tbm parameter): regular Google client.

The field `tbs` allows to customize the search even more.

[The full documentation is available here.](https://serpapi.com/search-api)

## Contributing

Contributions are welcome, feel to submit a pull request!

To run the tests:

```bash
export API_KEY="your api key"
rake test
```
