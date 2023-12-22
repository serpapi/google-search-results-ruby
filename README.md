# Google Search Results in Ruby

[![serpapi-search-ruby](https://github.com/serpapi/google-search-results-ruby/actions/workflows/ruby.yml/badge.svg)](https://github.com/serpapi/google-search-results-ruby/actions/workflows/ruby.yml)
[![Gem Version](https://badge.fury.io/rb/google_search_results.svg)](https://rubygems.org/gems/google_search_results)

This Ruby Gem is meant to scrape and parse results from Google, Bing, Baidu, Yandex, Yahoo, Ebay and more using [SerpApi](https://serpapi.com).

The following services are provided:

  * [Search API](https://serpapi.com/search-api)
  * [Location API](https://serpapi.com/locations-api)
  * [Search Archive API](https://serpapi.com/search-archive-api)
  * [Account API](https://serpapi.com/account-api)

SerpApi.com provides a [script builder](https://serpapi.com/playground) to get you started quickly.

## Installation

Modern Ruby must be already installed:

```bash
$ gem install google_search_results
```

[Link to the gem page](https://rubygems.org/gems/google_search_results/)

Tested Ruby versions:

 - 2.5
 - 3.0
 - 3.1
 - 3.2

See: [GitHub Actions](https://github.com/serpapi/google-search-results-ruby/blob/9cbd9d64786aeff9765a2417ae007a1fb43ab110/.github/workflows/ruby.yml#L16).

## Quick start

```ruby
require 'google_search_results'
search = GoogleSearch.new(q: "coffee", serp_api_key: "secret_api_key")
hash_results = search.get_hash
 ```

This example runs a search about "coffee" using your secret api key.

The SerpApi.com service (backend)
 - searches on Google using the search: q = "coffee"
 - parses the messy HTML responses
 - return a standardizes JSON response
The class GoogleSearch
 - Format the request to SerpApi.com server
 - Execute GET http request
 - Parse JSON into Ruby Hash using JSON standard library provided by Ruby
Et voila..

Alternatively, you can search:
 - Bing using BingSearch class
 - Baidu using BaiduSearch class
 - Yahoo using YahooSearch class
 - Yandex using YandexSearch class
 - Ebay using EbaySearch class
 - Home depot using HomeDepotSearch class
 - Youtube using YoutubeSearch class

See the [playground to generate your code.](https://serpapi.com/playground)

### Summary
- [Google Search Results in Ruby](#google-search-results-in-ruby)
  - [Installation](#installation)
  - [Quick start](#quick-start)
- [Summary](#summary)
  - [Guide](#guide)
    - [How to set the private API key](#how-to-set-the-private-api-key)
    - [Search API capability for Google](#search-api-capability-for-google)
    - [Example by specification](#example-by-specification)
    - [Location API](#location-api)
    - [Search Archive API](#search-archive-api)
    - [Account API](#account-api)
    - [Search Google Images](#search-google-images)
    - [Search Google News](#search-google-news)
    - [Search Google Shopping](#search-google-shopping)
    - [Google Search By Location](#google-search-by-location)
    - [Batch Asynchronous search](#batch-asynchronous-search)
  - [Supported search engine](#supported-search-engine)
    - [Google search API](#google-search-api)
    - [Bing search API](#bing-search-api)
    - [Baidu search API](#baidu-search-api)
    - [Yahoo search API](#yahoo-search-api)
    - [Yandex search API](#yandex-search-api)
    - [Ebay search API](#ebay-search-api)
    - [Generic SerpApi search](#generic-serpapi-search)
- [Error management](#error-management)
- [Change log](#change-log)
- [Roadmap](#roadmap)
- [Conclusion](#conclusion)
- [Contributing](#contributing)

## Guide
### How to set the private API key
The api_key can be set globally using a singleton pattern.

```ruby
GoogleSearch.api_key = "secret_api_key"
search = GoogleSearch.new(q: "coffee")
```

or api_key can be provided for each search.

```ruby
search = GoogleSearch.new(q: "coffee", api_key: "secret_api_key")
```

To get the key simply copy/paste from [serpapi.com/dashboard](https://serpapi.com/dashboard).

### Search API capability for Google

```ruby
search_params = {
  q: "search",
  google_domain: "Google Domain",
  location: "Location Requested",
  device: "desktop|mobile|tablet",
  hl: "Google UI Language",
  gl: "Google Country",
  safe: "Safe Search Flag",
  num: "Number of Results",
  start: "Pagination Offset",
  api_key: "private key", # copy paste from https://serpapi.com/dashboard
  tbm: "nws|isch|shop",
  tbs: "custom to be search criteria",
  async: true|false # allow async
}

# define the search search
search = GoogleSearch.new(search_params)

# override an existing parameter
search.params[:location] = "Portland,Oregon,United States"

# search format return as raw html
html_results = search.get_html

# search format returns a Hash
hash_results = search.get_hash

# search as raw JSON format
json_results = search.get_json
```

(the full documentation)[https://serpapi.com/search-api].

More search API are documented on [SerpApi.com](http://serpapi.com).

You will find more hands on examples below.

### Example by specification
We love true open source, continuous integration and Test Drive Development (TDD).
 We are using RSpec to test [our infrastructure around the clock](https://travis-ci.org/serpapi/google-search-results-ruby) to achieve the best QoS (Quality Of Service).

The directory test/ includes specification/examples.

Set your api key.

```bash
export API_KEY="your secret key"
```

Install RSpec

```bash
gem install rspec
```

To run the test:

```bash
rspec test
```

or if you prefers Rake

```bash
rake test
```

### Location API

```ruby
location_list = GoogleSearch.new(q: "Austin", limit: 3).get_location
pp location_list
```

it prints the first 3 location matching Austin (Texas, Texas, Rochester)

```ruby
[
  {
    id: "585069bdee19ad271e9bc072",
    google_id: 200635,
    google_parent_id: 21176,
    name: "Austin, TX",
    canonical_name: "Austin,TX,Texas,United States",
    country_code: "US",
    target_type: "DMA Region",
    reach: 5560000,
    gps: [-97.7430608, 30.267153],
    keys: ["austin", "tx", "texas", "united", "states"]
  },
  #...
]
```

### Search Archive API
This API allows to retrieve previous search.
To do so run a search to save a `search_id`.

```ruby
search = GoogleSearch.new(q: "Coffee", location: "Portland")
original_search = search.get_hash
search_id = original_search[:search_metadata][:id]
```

Now let retrieve the previous search from the archive.

```ruby
search = GoogleSearch.new
archive_search = search.get_search_archive(search_id)
pp archive_search
```

it prints the search from the archive.

### Account API

```ruby
search = GoogleSearch.new
pp search.get_account
```
it prints your account information.

### Search Google Images

```ruby
search = GoogleSearch.new(q: 'cofffe', tbm: "isch")
image_results_list = search.get_hash[:images_results]
image_results_list.each do |image_result|
  puts image_result[:original]
end
```

To download the image: `wget #{image_result[:original]}`

this code prints all the images links,
 and download image if you un-comment the line with wget (linux/osx tool to download image).

### Search Google News

```ruby
search = GoogleSearch.new({
  q: 'cofffe', # search search
  tbm: "nws", # news
  tbs: "qdr:d", # last 24h
  num: 10
})

3.times do |offset|
  search.params[:start] = offset * 10
  news_results_list = search.get_hash[:news_results]
  news_results_list.each do |news_result|
    puts "#{news_result[:position] + offset * 10} - #{news_result[:title]}"
  end
end
```

this script prints the first 3 pages of the news title for the last 24h.

### Search Google Shopping

```ruby
search = GoogleSearch.new({
  q: 'cofffe', # search search
  tbm: "shop", # shopping
  tbs: "tbs=p_ord:rv" # by best review
})
shopping_results_list = search.get_hash[:shopping_results]
shopping_results_list.each do |shopping_result|
  puts "#{shopping_result[:position]} - #{shopping_result[:title]}"
end
```

This script prints all the shopping results order by review order with position.

### Google Search By Location

With SerpApi.com, we can build Google search from anywhere in the world.
This code is looking for the best coffee shop per city.

```ruby
["new york", "paris", "berlin"].each do |city|
    # get location from the city name
    location = GoogleSearch.new({q: city, limit: 1}).get_location.first[:canonical_name]

    # get top result
    search = GoogleSearch.new({
      q: 'best coffee shop',
      location: location,
      num: 1,  # number of result
      start: 0 # offset
    })
    top_result = search.get_hash[:organic_results].first

    puts "top coffee result for #{location} is: #{top_result[:title]}"
  end
```

### Batch Asynchronous search

We do offer two ways to boost your searches thanks to `async` parameter.
 - Non-blocking - async=true  (recommended)
 - Blocking - async=false - it's more compute intensive because the search would need to hold many connections.

```ruby
company_list = %w(microsoft apple nvidia)

puts "submit batch of asynchronous searches"
search = GoogleSearch.new({async: true})

search_queue = Queue.new
company_list.each do |company|
  # set search
  search.params[:q] = company

  # store request into a search_queue - no-blocker
  result = search.get_hash()
  if result[:search_metadata][:status] =~ /Cached|Success/
    puts "#{company}: search done"
    next
  end

  # add result to the search queue
  search_queue.push(result)
end

puts "wait until all searches are cached or success"
search = GoogleSearch.new
while !search_queue.empty?
  result = search_queue.pop
  # extract search id
  search_id = result[:search_metadata][:id]

  # retrieve search from the archive - blocker
  search_archived = search.get_search_archive(search_id)
  if search_archived[:search_metadata][:status] =~ /Cached|Success/
    puts "#{search_archived[:search_parameters][:q]}: search done"
    next
  end

  # add result to the search queue
  search_queue.push(result)
end

search_queue.close
puts 'all searches completed'
  ```
This code shows a simple implementation to run a batch of asynchronously searches.


## Supported search engine
### Google search API

```ruby
GoogleSearch.api_key = ""
search = GoogleSearch.new(q: "Coffee", location: "Portland")
pp search.get_hash
```

https://serpapi.com/search-api

### Bing search API

```ruby
BingSearch.api_key = ""
search = BingSearch.new(q: "Coffee", location: "Portland")
pp search.get_hash
```

https://serpapi.com/bing-search-api

### Baidu search API

```ruby
BaiduSearch.api_key = ""
search = BaiduSearch.new(q: "Coffee")
pp search.get_hash
```

https://serpapi.com/baidu-search-api

### Yahoo search API

```ruby
YahooSearch.api_key = ""
search = YahooSearch.new(p: "Coffee")
pp search.get_hash
```

https://serpapi.com/yahoo-search-api

### Yandex search API

```ruby
YandexSearch.api_key = ""
search = YandexSearch.new(text: "Coffee")
pp search.get_hash
```

https://serpapi.com/yandex-search-api

### Ebay search API

```ruby
EbaySearch.api_key = ""
search = EbaySearch.new(_nkw: "Coffee")
pp search.get_hash
```

https://serpapi.com/ebay-search-api

### Youtube search API

```ruby
YoutubeySearch.api_key = ""
search = YoutubeSearch.new(search_query: "Coffee")
pp search.get_hash
```

https://serpapi.com/youtube-search-api

### Homedepot search API

```ruby
HomedepotSearch.api_key = ""
search = HomedepotSearch.new(q: "Coffee")
pp search.get_hash
```

https://serpapi.com/home-depot-search-api

### Walmart search API

```ruby
WalmartSearch.api_key = ""
search = WalmartSearch.new(query: "Coffee")
pp search.get_hash
```

https://serpapi.com/walmart-search-api

### Duckduckgo search API

```ruby
DuckduckgoSearch.api_key = ""
search = DuckduckgoSearch.new(query: "Coffee")
pp search.get_hash
```

https://serpapi.com/duckduckgo-search-api

### Naver search API

```ruby
search = NaverSearch.new(query: "Coffee", api_key: "secretApiKey")
pp search.get_hash
```

https://serpapi.com/duckduckgo-search-api

### Apple store search API

```ruby
search = AppleStoreSearch.new(term: "Coffee", , api_key: "secretApiKey")
pp search.get_hash
```

https://serpapi.com/duckduckgo-search-api

### Generic SerpApi search

```ruby
SerpApiSearch.api_key = ENV['API_KEY']
query = {
  p: "Coffee",
  engine: "youtube"
}
search = SerpApiSearch.new(query)
hash = search.get_hash
pp hash[:organic_results]
```

see: google-search-results-ruby/test/search_api_spec.rb


### Error management

This library follows the regular raise an exception when something goes wrong provided by Ruby.
 Any networking related exception will be returned as is. 
  Anything related to the client layer will be returned as a SerpApiException.
   A SerpApiException might be caused by a bug in the library.
   A networking problem will be caused by either SerpApi.com or your internet.

# Change log
 * 2.2 
   - add apple store search engine
   - add naver search engine
 * 2.1 - Add more search engine: Youtube, Duckduckgo, Homedepot, Walmart
      - improve error management and documentation.
 * 2.0 - API simplified( GoogleSearchResults -> GoogleSearch), fix gem issue with 2.6+ Ruby, Out Of Box step to verify the package before delivery.
 * 1.3.2 - rename variable client to search for naming consistency
 * 1.3 - support for all major search engine
 * 1.2 - stable versino to support goole and few more search engine
 * 1.1 - client connection improvement to allow multi threading and fiber support
 * 1.0 - first stable version with Google engine search with Google image

# Roadmap
 * 2.1 Improve exception / HTTP status handling

# Conclusion
SerpApi supports all the major search engines. Google has the more advance support with all the major services available: Images, News, Shopping and more..
To enable a type of search, the field tbm (to be matched) must be set to:

 * isch: Google Images API.
 * nws: Google News API.
 * shop: Google Shopping API.
 * any other Google service should work out of the box.
 * (no tbm parameter): regular Google search.

The field `tbs` allows to customize the search even more.

[The full documentation is available here.](https://serpapi.com/search-api)

# Contributing

Contributions are welcome, feel to submit a pull request!

To run the tests:

```bash
export API_KEY="your api key"
rake test
```
