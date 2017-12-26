# Google Search Results in Ruby

[![Gem Version](https://badge.fury.io/rb/google_search_results.svg)](https://rubygems.org/gems/google_search_results/)
[![Build Status](https://travis-ci.org/serpapi/google-search-results-ruby.svg?branch=master)](https://travis-ci.org/serpapi/google-search-results-ruby)

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

## Example of Ruby Hash Output (GoogleSearchResults#get_hash)

    query = GoogleSearchResults.new q: "coffee", location: "Portland"
    hash_results = query.get_hash

    {
      "search_information": {
        "total_results": 520000000,
        "time_taken": 0.77,
        "query": "Coffee",
        "location": "Portland, Oregon"
      },
      "serp_api_data": {
        "total_time_taken": 273.455948,
        "google_url": "https://www.google.com/search?q=Coffee&oq=Coffee&uule=w+CAIQICIdUG9ydGxhbmQsT3JlZ29uLFVuaXRlZCBTdGF0ZXM&sourceid=chrome&ie=UTF-8"
      },
      "map": {
        "link": "https://www.google.com/search?q=Coffee&npsic=0&rflfq=1&rldoc=1&rlha=0&rllag=45520942,-122680928,234&tbm=lcl&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQtgMIKQ",
        "image": true
      },
      "local_results": [
        {
          "position": 1,
          "title": "Case Study Coffee Roasters",
          "rating": 4.4,
          "reviews": 373,
          "type": "Coffee Shop",
          "address": "802 SW 10th Ave",
          "description": "In-house roasts & bagels at stylish cafe",
          "keywords": [
            "Quick bite",
            "Fast service",
            "Hip"
          ],
          "thumbnail": true
        },
        {
          "position": 2,
          "title": "Public Domain",
          "rating": 4.2,
          "reviews": 262,
          "price": "$",
          "type": "Coffee Shop",
          "address": "603 SW Broadway",
          "description": "Carefully sourced coffee in a spare cafe",
          "hours": "Closing soon: 5:00 PM",
          "thumbnail": true
        },
        {
          "position": 3,
          "title": "Courier Coffee",
          "rating": 4.5,
          "reviews": 169,
          "type": "Cafe",
          "address": "923 SW Oak St",
          "description": "Quaint cafe for espresso & pour-overs",
          "keywords": [
            "Fast service",
            "Hip",
            "Cozy"
          ],
          "thumbnail": true
        }
      ],
      "knowledge_graph": {
        "title": "Coffee",
        "type": "Drink",
        "image": true,
        "description": "Coffee is a brewed drink prepared from roasted coffee beans, which are the seeds of berries from the Coffea plant. The genus Coffea is native to tropical Africa and Madagascar, the Comoros, Mauritius, and Réunion in the Indian Ocean.",
        "source": {
          "name": "Wikipedia",
          "link": "https://en.wikipedia.org/wiki/Coffee"
        },
        "related_searches": [
          {
            "name": "Tea",
            "link": "https://www.google.com/search?q=Tea&stick=H4sIAAAAAAAAAONgFuLUz9U3MCorTMtV4gAxzZNzKrQE_UpLijJLMvPzgjNTUssTK4sByyY5qioAAAA&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQxA0IigIwHA",
            "image": true
          },
          {
            "name": "Espresso",
            "link": "https://www.google.com/search?q=Espresso&stick=H4sIAAAAAAAAAONgFuLUz9U3MCorTMtV4gAxk0vSsrUE_UpLijJLMvPzgjNTUssTK4sBwYKq7CoAAAA&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQxA0IjAIwHA",
            "image": true
          },
          {
            "name": "Chocolate",
            "link": "https://www.google.com/search?q=Chocolate&stick=H4sIAAAAAAAAAONgFuLUz9U3MCorTMtV4gAzDcpytAT9SkuKMksy8_OCM1NSyxMriwHR8y5PKgAAAA&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQxA0IjgIwHA",
            "image": true
          },
          {
            "name": "Cappuccino",
            "link": "https://www.google.com/search?q=Cappuccino&stick=H4sIAAAAAAAAAONgFuLUz9U3MCorTMtV4gAxLc0NjLQE_UpLijJLMvPzgjNTUssTK4sB6b-xkioAAAA&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQxA0IkAIwHA",
            "image": true
          },
          {
            "name": "Latte",
            "link": "https://www.google.com/search?q=Latte&stick=H4sIAAAAAAAAAONgFuLUz9U3MCorTMtVAjMN84pMzbQE_UpLijJLMvPzgjNTUssTK4sBjSmgBisAAAA&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQxA0IkgIwHA",
            "image": true
          }
        ],
        "more_related_searches_link": "https://www.google.com/search?q=Coffee&stick=H4sIAAAAAAAAAONgFuLUz9U3MCorTMtVQjC1xLKTrfTT8vNTwIRVcWZKanliZTEAKVBbezAAAAA&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQzToIhwIoATAc"
      },
      "answer_box": {
        "type": "unknow"
      },
      "organic_results": [
        {
          "position": 1,
          "title": "Public Domain Specialty Coffee Shop - Portland, OR",
          "link": "http://www.publicdomaincoffee.com/",
          "displayed_link": "www.publicdomaincoffee.com/",
          "thumbnail": true,
          "snippet": "Specialty coffee shop. Artisanal roast masters batch roast coffee weekly. Skilled baristas create customized coffee drinks.",
          "cached_link": "http://webcache.googleusercontent.com/search?q=cache:6VLIhl7rVCsJ:www.publicdomaincoffee.com/+&cd=4&hl=en&ct=clnk&gl=us",
          "related_link": "https://www.google.com/search?q=related:www.publicdomaincoffee.com/+Coffee&tbo=1&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQHwhpMAM"
        },
        {
          "position": 2,
          "title": "Downtown Portland's 10 best coffee shops | OregonLive.com - Portland",
          "link": "http://www.oregonlive.com/dining/index.ssf/2017/09/downtown_portlands_10_best_cof.html",
          "displayed_link": "www.oregonlive.com/dining/index.ssf/2017/.../downtown_portlands_10_best_cof.ht...",
          "thumbnail": true,
          "date": "Sep 27, 2017",
          "snippet": "There's no shortage of places to get a quick cup of coffee in downtown Portland. But when you're looking for locally roasted beans, a treat-yourself latte or somewhere relaxing to settle in for a couple hours, these 10 downtown coffee shops are for you. ... Portland's pioneering multi ...",
          "cached_link": "http://webcache.googleusercontent.com/search?q=cache:ec8ZBekWxroJ:www.oregonlive.com/dining/index.ssf/2017/09/downtown_portlands_10_best_cof.html+&cd=5&hl=en&ct=clnk&gl=us"
        },
        {
          "position": 3,
          "title": "Home / Barista - Portland",
          "link": "http://www.baristapdx.com/",
          "displayed_link": "www.baristapdx.com/",
          "thumbnail": true,
          "snippet": "Welcome to Barista.",
          "cached_link": "http://webcache.googleusercontent.com/search?q=cache:OpyWAEWAJ-MJ:www.baristapdx.com/+&cd=6&hl=en&ct=clnk&gl=us",
          "related_link": "https://www.google.com/search?q=related:www.baristapdx.com/+Coffee&tbo=1&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQHwh1MAU"
        },
        {
          "position": 4,
          "title": "Portland Roasting Coffee",
          "link": "https://portlandroastingcoffee.com/",
          "displayed_link": "https://portlandroastingcoffee.com/",
          "thumbnail": true,
          "snippet": "Costa Rica. Light | Single OriginBUY · Tour the roastery click here for information. Locate Portland Roasting Coffee. Locate. Portland Roasting Coffee, established 1996. Learn More. FOLLOW US ON INSTAGRAM @pdxroasting ...",
          "related_link": "https://www.google.com/search?q=related:https://portlandroastingcoffee.com/+Coffee&tbo=1&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQHwh7MAY"
        },
        {
          "position": 5,
          "title": "Coffee - Wikipedia",
          "link": "https://en.wikipedia.org/wiki/Coffee",
          "displayed_link": "https://en.wikipedia.org/wiki/Coffee",
          "thumbnail": true,
          "snippet": "Coffee is a brewed drink prepared from roasted coffee beans, which are the seeds of berries from the Coffea plant. The genus Coffea is native to tropical Africa and Madagascar, the Comoros, Mauritius, and Réunion in the Indian Ocean. The plant was exported from Africa to Arabia and to countries around the world. Coffee ...",
          "sitelinks": {
            "inline": [
              {
                "title": "History",
                "link": "https://en.wikipedia.org/wiki/Coffee#History"
              },
              {
                "title": "Cultivation",
                "link": "https://en.wikipedia.org/wiki/Coffee#Cultivation"
              },
              {
                "title": "Processing",
                "link": "https://en.wikipedia.org/wiki/Coffee#Processing"
              },
              {
                "title": "Health effects",
                "link": "https://en.wikipedia.org/wiki/Coffee#Health_effects"
              }
            ]
          },
          "related_link": "https://www.google.com/search?q=related:https://en.wikipedia.org/wiki/Coffee+Coffee&tbo=1&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQHwiBATAH"
        },
        {
          "position": 6,
          "title": "Coava Coffee Roasters - Coffee Roaster, Subscriptions, Shop",
          "link": "https://coavacoffee.com/",
          "displayed_link": "https://coavacoffee.com/",
          "thumbnail": true,
          "snippet": "Coava Coffee Roasters: Highest quality, specialty coffee roasted fresh to order; coffee subscriptions, brew tips, buy coffee online, Portland & San Diego cafes.",
          "related_link": "https://www.google.com/search?q=related:https://coavacoffee.com/+Coffee&tbo=1&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQHwiMATAI"
        },
        {
          "position": 7,
          "title": "Sip Coffee at These 20 Portland Roasters and Cafes - Eater Portland",
          "link": "https://pdx.eater.com/maps/20-great-portland-coffee-shops",
          "displayed_link": "https://pdx.eater.com/maps/20-great-portland-coffee-shops",
          "thumbnail": true,
          "date": "Sep 20, 2017",
          "snippet": "Sometimes, when you love something, you just keep talking about it. In this case, that would be coffee, coffee people, and coffeeshops. To get up close and personal with Portland coffee, Emily McIntyre, a former barista turned coffee writer and consultant, shares the 20 coffee shops she thinks serve the best ...",
          "related_link": "https://www.google.com/search?q=related:https://pdx.eater.com/maps/20-great-portland-coffee-shops+Coffee&tbo=1&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQHwiSATAJ"
        },
        {
          "position": 8,
          "title": "16 Places in Portland to Drink Coffee Right Now | Portland Monthly",
          "link": "https://www.pdxmonthly.com/articles/2017/2/20/16-places-in-portland-to-drink-coffee-right-now",
          "displayed_link": "https://www.pdxmonthly.com/.../2/.../16-places-in-portland-to-drink-coffee-right-now",
          "thumbnail": true,
          "date": "Feb 20, 2017",
          "snippet": "Northeast's Roseway hood was a coffee wasteland until BFFs Marten Boyden and Austin Roberts opened this bright, spartan café in 2016. Now neighbors clamor for the chatty pair's exuberant yet balanced roasts—consumed via drip, via pour-over, or prepped on the café's Rocket R9 (plus, heady, ...",
          "related_link": "https://www.google.com/search?q=related:https://www.pdxmonthly.com/articles/2017/2/20/16-places-in-portland-to-drink-coffee-right-now+Coffee&tbo=1&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQHwiZATAK"
        },
        {
          "position": 9,
          "title": "Heart Coffee Roasters - Portland",
          "link": "https://www.heartroasters.com/",
          "displayed_link": "https://www.heartroasters.com/",
          "thumbnail": true,
          "snippet": "Heart is a café, roaster & bustling destination point located in Portland, Oregon.",
          "related_link": "https://www.google.com/search?q=related:https://www.heartroasters.com/+Coffee&tbo=1&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQHwigATAL"
        },
        {
          "position": 10,
          "title": "Bulletproof Coffee: Debunking the Hot Buttered Hype - Gizmodo",
          "link": "https://gizmodo.com/bulletproof-coffee-debunking-the-hot-buttered-hype-1681321467",
          "displayed_link": "https://gizmodo.com/bulletproof-coffee-debunking-the-hot-buttered-hype-1681321467",
          "thumbnail": true,
          "snippet": "People are putting butter in their coffee. And hey, if you're just craving a new flavor experience, more power to you. The problem is that Bulletproof Coffee, the company behind the trend, is claiming that drinking a mug of fatty joe every morning instead of eating breakfast is a secret shortcut to weight loss and ..."
        },
        {
          "position": 11,
          "title": "The Case for Drinking as Much Coffee as You Like - The Atlantic",
          "link": "https://www.theatlantic.com/health/archive/2012/11/the-case-for-drinking-as-much-coffee-as-you-like/265693/",
          "displayed_link": "https://www.theatlantic.com/health/archive/2012/11/the-case-for...coffee.../265693/",
          "thumbnail": true,
          "snippet": "\"What I tell patients is, if you like coffee, go ahead and drink as much as you want and can,\" says Dr. Peter Martin, director of the Institute for Coffee Studies at Vanderbilt University. He's even developed a metric for monitoring your dosage: If you are having trouble sleeping, cut back on your last cup of the ..."
        },
        {
          "position": 12,
          "title": "Health effects of coffee: Where do we stand? - CNN - CNN.com",
          "link": "http://www.cnn.com/2015/08/14/health/coffee-health/index.html",
          "displayed_link": "www.cnn.com/2015/08/14/health/coffee-health/index.html",
          "thumbnail": true,
          "snippet": "The verdict on coffee is mostly positive these days, but it hasn't always been so well-received."
        }
      ],
      "related_place_searches": [
        {
          "query": "Best coffee",
          "link": "https://www.google.com/search?tbm=lcl&q=Coffee&rflfq=1&num=20&uule=w+CAIQICIdUG9ydGxhbmQsT3JlZ29uLFVuaXRlZCBTdGF0ZXM&stick=H4sIAAAAAAAAAB1QO04FQQzTaxAS5VJtxRESJ86n5SrovZYCDsa5OAVepNFoknFsx89P5xHgZlpWdbWNW-I8MmsqYsJ6kdXAnq9u0-7tgaJNYth9HtsVJdxgc-ljLEGbZhYzuofp5MZ5THiPGDRaHGn2CBq09BjSKTwYEer-q07MghB_OkxaYpgdJFtmYqcgaKUbGylt2CaaVzf0KlR5lATT9t9XpjxchdGwxG6dRwccIrwMaEPtrQjAIciU4UKbEJctjY1p_c1GKxabK5jQd1mnsmJ0elvKrFnBKe-S5nrOtW2u77ZogXLT26UlwK7ceKnUdBnV3NhyRatjvPjt53b7vb2837--3z4-H4_7_Q8WyWmFwQEAAA&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQ_KoBCKwBMA8",
          "snippet": "Spella Caffe, Stumptown Coffee Roasters, and 18 more"
        },
        {
          "query": "Coffee and Wi-Fi",
          "link": "https://www.google.com/search?tbm=lcl&q=Coffee&rflfq=1&num=20&uule=w+CAIQICIdUG9ydGxhbmQsT3JlZ29uLFVuaXRlZCBTdGF0ZXM&stick=H4sIAAAAAAAAAB2RPWokURCDmcRsaDwbdeQLGOpPVaXY4Cs4NuwMONm92p7Lp7Da0MFD9aT6nvrXw3FNRhTB8kIA5ubHb-9yw0T5WhgrBiE1YeW5gGM1QGZKHZhZSjBblAPM41rV25mbNozqieBx3fRZ96nYxpbVrPxVkssIgwURZB_XsAyuTRU8OousE0AoHd2erZDTo6ucztaeDeohIpaoqxbe8ms7csrHzgCtWGvoSRMjKFue6o6oPEOTFRxmFIsmheNND9nbcMaGwYebbYJxnc-6ik4OaiNaBVIOBZh1OE54NOi1K5HJduHqU5II7aeCUU2K1GQIqI7jqVq_RlUnZ9nTnf8vl6_L4-u_-_12e_74--f5_fPl7fMbhYgcnsYBAAA&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQ_KoBCK4BMBA",
          "snippet": "Floyd's Coffee Shop Old Town, Peet's Coffee, and 18 more"
        },
        {
          "query": "Espresso bars",
          "link": "https://www.google.com/search?tbm=lcl&q=Coffee&rflfq=1&num=20&uule=w+CAIQICIdUG9ydGxhbmQsT3JlZ29uLFVuaXRlZCBTdGF0ZXM&stick=H4sIAAAAAAAAABWQPU4FQQyD9RpEQ7VUW3EEJ3H-DsBBQKIGvb0Y5-IU-EkzU1iO83men85XI8Oa2ETCN323pAbcCs11ZjStQalpsT2syF4v94iQ2gkgZvRO0jI3ziM8lwSruhpjoMtaNGQ7beBYeqefh8_MDkrTbdVhnAeBI613ohCrVGuTtfYRX6aE2m1xnsdubFkFdDQjbIlttpMwusjWm3K-mohVLBmCW0-sChw2ZMrmAZp3DbSJ-hh4llcJWdVqVOoxpHWdwwRHr0LH01tX-3siDeO_t9vf7eX9-rl_Xdf32-fH_foHSrpVaW0BAAA&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQ_KoBCLABMBE",
          "snippet": "Caffè Umbria, Water Avenue Coffee, and 14 more"
        },
        {
          "query": "College hangouts",
          "link": "https://www.google.com/search?tbm=lcl&q=Coffee&rflfq=1&num=20&uule=w+CAIQICIdUG9ydGxhbmQsT3JlZ29uLFVuaXRlZCBTdGF0ZXM&stick=H4sIAAAAAAAAAB1RO05DQQxUGkSJeFRbcQR7_K85CUUUiogUwL04V07BLNVao_F8vI8P60XhWWjrQcDSXCHrgBimpdxDQXDGCUYHIrxVEyVQ2DratAiUozPaxavXMZWUkmqMT2hLJJ0sxNU6QqNbEGbcd89OsyZ7_qNgSJWQlgwZLxQx6Y3aOBKZakk_l6HswdzGmCiDWYE6zG8zpVzWTBFNetTeZ-ZkKRqFlWuJbxQSWtOWQgPlrOxqGYVUFzbl7BQ4QhkUOc5CMxSKzWyewlh--CgqCVKUsjFVyXTARms9m4pIkZs8CLJ3fA3XnJ4xFpBOXmgd2eqNjtGG7g9A_J5O99PT2-16PV_Orx_vn5fbz_fXHxgLuX_CAQAA&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQ_KoBCLIBMBI",
          "snippet": "Stumptown Coffee Roasters, Starbucks, and 18 more"
        },
        {
          "query": "Tea houses",
          "link": "https://www.google.com/search?tbm=lcl&q=Coffee&rflfq=1&num=20&uule=w+CAIQICIdUG9ydGxhbmQsT3JlZ29uLFVuaXRlZCBTdGF0ZXM&stick=H4sIAAAAAAAAABWPPU5EMRCD9RqEKHlbpdojzHh-PLkHF6BYiY5ixb04F6fAT4qUxHE-e15f1s2tbKzLdhIkYLPXu7bYaM8Od--KlDObGzUdMWADMyG1UwgifQyCgIVLpVeP04CmJSdKasDKuSda-HSdfZ3YdNKsqj0qr6_rVFBkFhiIIMJo69QjVVGsyhQ3hoJeeOnIMm4PT1lvXnOtiMQkd5cu61S0Gqq6K14dFCgqoaa7tqUjzUNODZvUtPJ4B3cVUwWme8blCPONwVT-Hsff8fbx-Lx_ff88H89_A_OmgVQBAAA&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQ_KoBCLQBMBM",
          "snippet": "World Cup Coffee & Tea @ Powell's, Red Robe Tea House & Cafe, and 13 more"
        },
        {
          "query": "Quiet cafes",
          "link": "https://www.google.com/search?tbm=lcl&q=Coffee&rflfq=1&num=20&uule=w+CAIQICIdUG9ydGxhbmQsT3JlZ29uLFVuaXRlZCBTdGF0ZXM&stick=H4sIAAAAAAAAABVQy2meQQzkv4RAbv582pNL0Og9ZaQEYxzIOXZfrstVZD5YFq1W89LPH-cZKLa5eVV1WQ521J02jCU8jER0rZ2LXpFZPuERo69R02tL4FygfcwFOdcA3DKkxy59MkykSZCjUfeGqYYLz8GMmeQRlejBubI7nck0xtRGr0jJYKPDdKzQt_wzwlUPNWPBhGqcp2y6Fyo4y57uG27WjupIKimRu-eqlombSTxK5EbcRnOGaofUhlWTdp4CZjax3VbtvdW3etSuro6dimjmnGtFI-va6sABxaVGV2_jGI0uNeG0ve1KGY1Y7UPLTc9zhSs-a8e2xBML_3o8vh-_fn_-ff94eXv98_7vPzVhKZ-8AQAA&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQ_KoBCLYBMBQ",
          "snippet": "Café Ponté, Nuvrei, and 18 more"
        },
        {
          "query": "Coffee shops",
          "link": "https://www.google.com/search?tbm=lcl&q=Coffee&rflfq=1&num=20&uule=w+CAIQICIdUG9ydGxhbmQsT3JlZ29uLFVuaXRlZCBTdGF0ZXM&stick=H4sIAAAAAAAAAB2Qu20DYQyD4SZIke5SXeURJOpdZxYb6RzAi2WuTBHKzeE_QiI_8f3tPKZNexoepdI2nTg_1caRyFTLcrhM5KqQ0OJGCgeUb6VaISLWzW8H1Rg7D0OMu3hmZUmrOJhVaWlSjfEJbXm5SpfSyZAh7eioOg9SVVPmf0bTqHpHOSEcGy9UAdKzWCGu1hEapECYLcAADCGmByJERc_DPTvNmgwDTzrsvjvD9kbaYwIzi5XOuIITEwxExRbz2mrrQYC3uELOA9Gb4QROlEBhi8VHSjmTwsq1xKkGu632tCBCAgtLhNGZogOQJJ1R1lVGJ9azZ7EicuP3cvm7fHw97vfb7fr8fvw8_wEDp1JFxAEAAA&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQ_KoBCLgBMBU",
          "snippet": "Deadstock Coffee, Barista, and 18 more"
        }
      ],
      "related_searches": [
        {
          "query": "barista coffee portland",
          "link": "https://www.google.com/search?q=barista+coffee+portland&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQ1QIIugEoAA"
        },
        {
          "query": "public domain coffee menu",
          "link": "https://www.google.com/search?q=public+domain+coffee+menu&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQ1QIIuwEoAQ"
        },
        {
          "query": "coava coffee roasters portland or",
          "link": "https://www.google.com/search?q=coava+coffee+roasters+portland+or&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQ1QIIvAEoAg"
        },
        {
          "query": "stumptown coffee roasters portland or",
          "link": "https://www.google.com/search?q=stumptown+coffee+roasters+portland+or&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQ1QIIvQEoAw"
        },
        {
          "query": "public domain coffee images",
          "link": "https://www.google.com/search?q=public+domain+coffee+images&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQ1QIIvgEoBA"
        },
        {
          "query": "best coffee roasters in portland",
          "link": "https://www.google.com/search?q=best+coffee+roasters+in+portland&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQ1QIIvwEoBQ"
        },
        {
          "query": "603 sw broadway portland, or 97205",
          "link": "https://www.google.com/search?q=603+sw+broadway+portland,+or+97205&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQ1QIIwAEoBg"
        },
        {
          "query": "barista coffee maker",
          "link": "https://www.google.com/search?q=barista+coffee+maker&sa=X&ved=0ahUKEwiznqyxuqbYAhVP12MKHfOzBqcQ1QIIwQEoBw"
        }
      ],
      "pagination": {
        "current": 1,
        "next": "https://www.google.com/search?q=Coffee&ei=fpxBWrPnJc-ujwPz55q4Cg&start=10&sa=N",
        "other_pages": {
          "2": "https://www.google.com/search?q=Coffee&ei=fpxBWrPnJc-ujwPz55q4Cg&start=10&sa=N",
          "3": "https://www.google.com/search?q=Coffee&ei=fpxBWrPnJc-ujwPz55q4Cg&start=20&sa=N",
          "4": "https://www.google.com/search?q=Coffee&ei=fpxBWrPnJc-ujwPz55q4Cg&start=30&sa=N",
          "5": "https://www.google.com/search?q=Coffee&ei=fpxBWrPnJc-ujwPz55q4Cg&start=40&sa=N",
          "6": "https://www.google.com/search?q=Coffee&ei=fpxBWrPnJc-ujwPz55q4Cg&start=50&sa=N",
          "7": "https://www.google.com/search?q=Coffee&ei=fpxBWrPnJc-ujwPz55q4Cg&start=60&sa=N",
          "8": "https://www.google.com/search?q=Coffee&ei=fpxBWrPnJc-ujwPz55q4Cg&start=70&sa=N",
          "9": "https://www.google.com/search?q=Coffee&ei=fpxBWrPnJc-ujwPz55q4Cg&start=80&sa=N",
          "10": "https://www.google.com/search?q=Coffee&ei=fpxBWrPnJc-ujwPz55q4Cg&start=90&sa=N"
        }
      }
    }
      
