# Google Search Results in Ruby

[![serpapi-search-ruby](https://github.com/serpapi/google-search-results-ruby/actions/workflows/ruby.yml/badge.svg)](https://github.com/serpapi/google-search-results-ruby/actions/workflows/ruby.yml)
[![Gem Version](https://badge.fury.io/rb/google_search_results.svg)](https://rubygems.org/gems/google_search_results)

Our **google_search_results** Ruby gem helps you scrape and parse results from Google, Bing, Baidu, Yandex, Yahoo, Ebay and more using [SerpApi](https://serpapi.com).

We provide the following services:

  * [Search API](https://serpapi.com/search-api)
  * [Location API](https://serpapi.com/locations-api)
  * [Search Archive API](https://serpapi.com/search-archive-api)
  * [Account API](https://serpapi.com/account-api)

Get started quickly with our [search query playground](https://serpapi.com/playground).

## Installation

Install the **google_search_results** gem with the following command:

```bash
$ gem install google_search_results
```

[Link to the gem page](https://rubygems.org/gems/google_search_results/)

The **google_search_results** gem supports the following Ruby versions:

 - 2.5
 - 3.0
 - 3.1
 - 3.2

See: [GitHub Actions](https://github.com/serpapi/google-search-results-ruby/blob/9cbd9d64786aeff9765a2417ae007a1fb43ab110/.github/workflows/ruby.yml#L16).

 Older versions of Ruby may still work, but are unsupported and not recommended.

## Quick start

The following example runs a Google search for "coffee" using your secret API key.

```ruby
require 'google_search_results'
search = GoogleSearch.new(q: "coffee", serp_api_key: "secret_api_key")
hash_results = search.get_hash
 ```

When the example code is run, the SerpApi.com service (backend) does the following:
 - Searches Google using the query: `q = "coffee"`.
 - Parses the HTML responses.
 - Returns a standardized JSON response.

On the client side, the provided Ruby class `GoogleSearch` completes the following:
 - Formats the request to the SerpApi.com server.
 - Executes a `GET` HTTP request.
 - Parses the JSON response from the SerpApi.com server into Ruby Hash using the Ruby standard library.

Alternatively, you can search:
 - Bing using the `BingSearch` class.
 - Baidu using the `BaiduSearch` class.
 - Yahoo using the `YahooSearch` class.
 - Yandex using the `YandexSearch` class.
 - Ebay using the `EbaySearch` class.
 - Home Depot using the `HomeDepotSearch` class.
 - Youtube using the `YoutubeSearch` class.

See the [ search query playground to generate your code](https://serpapi.com/playground).

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
### How to set a private API key
You can set an `api_key` globally using a singleton pattern, or you can provide an `api_key` for each search.

The following is an example of setting a global `api_key`:

```ruby
GoogleSearch.api_key = "secret_api_key"
search = GoogleSearch.new(q: "coffee")
```

The following is an example of providing an `api_key` for an individual search:

```ruby
search = GoogleSearch.new(q: "coffee", api_key: "secret_api_key")
```

You can find your API key at [serpapi.com/dashboard](https://serpapi.com/dashboard).

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

For details, see [Google Search Engine Results API documentation](https://serpapi.com/search-api).

Find documentation for other search APIs at [SerpApi.com](http://serpapi.com).


### Example by specification

Refer to the following examples to learn more about our Google search API's capabilities.


### Location API

```ruby
location_list = GoogleSearch.new(q: "Austin", limit: 3).get_location
pp location_list
```

Prints the first 3 locations matching `Austin` (Texas, Texas, Rochester).

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
Retrieves a  previous search.

For example, to retrieve a search, first run a search and save the search ID in a variable, `search_id`:

```ruby
search = GoogleSearch.new(q: "Coffee", location: "Portland")
original_search = search.get_hash
search_id = original_search[:search_metadata][:id]
```

Next, retrieve the previous search from the archive using the saved `search_id`.

```ruby
search = GoogleSearch.new
archive_search = search.get_search_archive(search_id)
pp archive_search
```

Finally, the search from the archive is printed in the terminal.

### Account API

```ruby
search = GoogleSearch.new
pp search.get_account
```
Prints your account information.

### Search Google Images

```ruby
search = GoogleSearch.new(q: 'coffee', tbm: "isch")
image_results_list = search.get_hash[:images_results]
image_results_list.each do |image_result|
  puts image_result[:original]
end
```

The previous code prints all image links. To print all image links **and** download all images using `wget`, use the following example code:

```ruby
search = GoogleSearch.new(q: 'coffee', tbm: "isch")
image_results_list = search.get_hash[:images_results]
image_results_list.each do |image_result|
  puts image_result[:original]
  wget #{image_result[:original]}
end
```

### Search Google News

The following example prints the first 3 pages of news titles from the past 24 hours.
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

### Search Google Shopping

The following example prints all shopping results. Shopping results with the best reviews are printed first.

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

### Google Search By Location

You can make Google searches for any location. The following example code searches Google for the best coffee shop in New York, Paris, and Berlin.

```ruby
["new york", "paris", "berlin"].each do |city|
    # get location from the city name
    location = GoogleSearch.new({q: city, limit: 1}).get_location.first[:canonical_name]

    # get top result
    search = GoogleSearch.new({
      q: 'best coffee shop',
      location: location,
      num: 1,  # number of results
      start: 0 # offset
    })
    top_result = search.get_hash[:organic_results].first

    puts "top coffee result for #{location} is: #{top_result[:title]}"
  end
```

### Batch Asynchronous search

Increase your search performance through batched searches using the `async` parameter.
 - Non-blocking - `async=true`  (recommended).
 - Blocking - `async=false` (not recommended). Blocking, or synchronous batched searches, are more compute intensive because they require many connections.

The following example shows how to run a batch of searches asynchronously.

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


## Supported search engines
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

For a complete list of supported search engines, see: [search_api_spec.rb](https://github.com/serpapi/google-search-results-ruby/blob/master/test/search_api_spec.rb)


### Error management

The **google_search_results** gem follows the regular flow of raising exceptions when something goes wrong in Ruby code, however, any network related exceptions will be returned as-is.

Errors related to the client layer will be returned as a `SerpApiException` object. When troubleshooting, note the following:

- A `SerpApiException` may be caused by a bug in the **google_search_results** gem.
- A network error can be caused by either SerpApi.com or your internet connection.

# Change log
 * 2.2
   - Add Apple store search engine.
   - Add Naver search engine.
 * 2.1 - Add more search engines: Youtube, Duckduckgo, Homedepot, Walmart.
      - Improve error management and documentation.
 * 2.0 - API simplified( GoogleSearchResults -> GoogleSearch), fix gem issue with 2.6+ Ruby, Out Of Box step to verify the package before delivery.
 * 1.3.2 - Rename variable client to search for naming consistency.
 * 1.3 - Support for all major search engine.
 * 1.2 - Stable version to support Google and additional search engines.
 * 1.1 - Client connection improvement to allow multi threading and fiber support.
 * 1.0 - First stable version with Google engine search with Google image.

# Roadmap
 * 2.1 Improve exception and HTTP status handling

# Conclusion
SerpApi supports all major search engines. We offer advanced support for Google search with integrations for many Google search services, including: Images, News, Shopping and more.
To enable a type of search, the field `tbm` (to be matched) must be set to:

 * isch: Google Images API.
 * nws: Google News API.
 * shop: Google Shopping API.
 * any other Google service should work out of the box.
 * (no tbm parameter): regular Google search.

The field `tbs` allows to customize the search even more.

For details, see the [search-api documentation](https://serpapi.com/search-api).

# Contributing

We love true open source, continuous integration and Test Drive Development (TDD).

We use RSpec to test [our infrastructure around the clock](https://travis-ci.org/serpapi/google-search-results-ruby) to achieve the best QoS (Quality Of Service).

The directory `test/` includes specifications and examples.

Contributions are welcome, feel to submit a pull request!

To run the tests:

```bash
export API_KEY="your api key"
gem install rspec
rpsec test # Or alternatively, `rake test`.
```
