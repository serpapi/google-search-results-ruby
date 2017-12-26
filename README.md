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

    {:search_information=>
      {:total_results=>524000000,
      :time_taken=>0.81,
      :query=>"coffee",
      :location=>"Portland, Oregon"},
    :serp_api_data=>
      {:total_time_taken=>2.474232757,
      :google_url=>
        "https://www.google.com/search?q=coffee&oq=coffee&uule=w+CAIQICIdUG9ydGxhbmQsT3JlZ29uLFVuaXRlZCBTdGF0ZXM&sourceid=chrome&ie=UTF-8"},
    :ads=>
      [{:position=>1,
        :block_position=>"bottom",
        :title=>"Shop -coffee on Amazon - Low Prices for -coffee‎",
        :link=>
        "https://www.amazon.com/-coffee-Grocery-Gourmet-Food/s?ie=UTF8&page=1&rh=n%3A16310101%2Ck%3A-coffee",
        :displayed_link=>"www.amazon.com/groceries",
        :rating=>0.0,
        :description=>
        "Read Customer Reviews & Find Best Sellers. Free 2-Day Shipping w/Amazon Prime.",
        :sitelinks=>
        [{:title=>"Prime Pantry",
          :link=>
            "http://www.amazon.com/b/?ie=UTF8&node=7301146011&ext=3160-15422&ref=%7B_hydref%7D&tag=%7B_hydtag%7D&hvpos=%7Badposition%7D&hvnetw=%7Bnetwork%7D&hvrand=%7Brandom%7D&hvpone=%7Bparam1%7D&hvptwo=%7Bparam2%7D&hvqmt=%7Bmatchtype%7D&hvdev=%7Bdevice%7D&hvdvcmdl=%7Bdevicemodel%7D&hvlocint=%7Bloc_interest_ms%7D&hvlocphy=%7Bloc_physical_ms%7D&hvtargid=%7Btargetid%7D"},
          {:title=>"Coffee",
          :link=>
            "http://www.amazon.com/b/?ie=UTF8&node=16318031&ext=3160-15423&ref=%7B_hydref%7D&tag=%7B_hydtag%7D&hvpos=%7Badposition%7D&hvnetw=%7Bnetwork%7D&hvrand=%7Brandom%7D&hvpone=%7Bparam1%7D&hvptwo=%7Bparam2%7D&hvqmt=%7Bmatchtype%7D&hvdev=%7Bdevice%7D&hvdvcmdl=%7Bdevicemodel%7D&hvlocint=%7Bloc_interest_ms%7D&hvlocphy=%7Bloc_physical_ms%7D&hvtargid=%7Btargetid%7D"},
          {:title=>"Candy & Gum",
          :link=>
            "http://www.amazon.com/b/?ie=UTF8&node=16322461&ext=3160-15426&ref=%7B_hydref%7D&tag=%7B_hydtag%7D&hvpos=%7Badposition%7D&hvnetw=%7Bnetwork%7D&hvrand=%7Brandom%7D&hvpone=%7Bparam1%7D&hvptwo=%7Bparam2%7D&hvqmt=%7Bmatchtype%7D&hvdev=%7Bdevice%7D&hvdvcmdl=%7Bdevicemodel%7D&hvlocint=%7Bloc_interest_ms%7D&hvlocphy=%7Bloc_physical_ms%7D&hvtargid=%7Btargetid%7D"},
          {:title=>"Cooking & Basics",
          :link=>
            "http://www.amazon.com/b/?ie=UTF8&node=16310221&ext=3160-15425&ref=%7B_hydref%7D&tag=%7B_hydtag%7D&hvpos=%7Badposition%7D&hvnetw=%7Bnetwork%7D&hvrand=%7Brandom%7D&hvpone=%7Bparam1%7D&hvptwo=%7Bparam2%7D&hvqmt=%7Bmatchtype%7D&hvdev=%7Bdevice%7D&hvdvcmdl=%7Bdevicemodel%7D&hvlocint=%7Bloc_interest_ms%7D&hvlocphy=%7Bloc_physical_ms%7D&hvtargid=%7Btargetid%7D"},
          {:title=>"Subscribe & Save",
          :link=>
            "http://www.amazon.com/b/?ie=UTF8&node=11030447011&ext=3160-15420&ref=%7B_hydref%7D&tag=%7B_hydtag%7D&hvpos=%7Badposition%7D&hvnetw=%7Bnetwork%7D&hvrand=%7Brandom%7D&hvpone=%7Bparam1%7D&hvptwo=%7Bparam2%7D&hvqmt=%7Bmatchtype%7D&hvdev=%7Bdevice%7D&hvdvcmdl=%7Bdevicemodel%7D&hvlocint=%7Bloc_interest_ms%7D&hvlocphy=%7Bloc_physical_ms%7D&hvtargid=%7Btargetid%7D"},
          {:title=>"Snacks",
          :link=>
            "http://www.amazon.com/b/?ie=UTF8&node=16322721&ext=3160-15424&ref=%7B_hydref%7D&tag=%7B_hydtag%7D&hvpos=%7Badposition%7D&hvnetw=%7Bnetwork%7D&hvrand=%7Brandom%7D&hvpone=%7Bparam1%7D&hvptwo=%7Bparam2%7D&hvqmt=%7Bmatchtype%7D&hvdev=%7Bdevice%7D&hvdvcmdl=%7Bdevicemodel%7D&hvlocint=%7Bloc_interest_ms%7D&hvlocphy=%7Bloc_physical_ms%7D&hvtargid=%7Btargetid%7D"}]}],
    :map=>
      {:link=>
        "https://www.google.com/search?q=coffee&npsic=0&rflfq=1&rldoc=1&rlha=0&rllag=45520429,-122677892,377&tbm=lcl&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQtgMIKQ",
      :image=>true},
    :local_results=>
      [{:position=>1,
        :title=>"Stumptown Coffee Roasters",
        :rating=>4.4,
        :reviews=>932,
        :price=>"$",
        :type=>"Cafe",
        :address=>"128 SW 3rd Ave",
        :description=>"Coffee bar serving direct-trade java",
        :hours=>"Closed now",
        :thumbnail=>true},
      {:position=>2,
        :title=>"Case Study Coffee Roasters",
        :rating=>4.4,
        :reviews=>373,
        :type=>"Coffee Shop",
        :address=>"802 SW 10th Ave",
        :description=>"In-house roasts & bagels at stylish cafe",
        :hours=>"Closing soon: 6:00 PM",
        :thumbnail=>true},
      {:position=>3,
        :title=>"Public Domain",
        :rating=>4.2,
        :reviews=>262,
        :price=>"$",
        :type=>"Coffee Shop",
        :address=>"603 SW Broadway",
        :description=>"Carefully sourced coffee in a spare cafe",
        :hours=>"Closed now",
        :thumbnail=>true}],
    :knowledge_graph=>
      {:title=>"Coffee",
      :type=>"Drink",
      :image=>true,
      :description=>
        "Coffee is a brewed drink prepared from roasted coffee beans, which are the seeds of berries from the Coffea plant. The genus Coffea is native to tropical Africa and Madagascar, the Comoros, Mauritius, and Réunion in the Indian Ocean.",
      :source=>
        {:name=>"Wikipedia", :link=>"https://en.wikipedia.org/wiki/Coffee"},
      :related_searches=>
        [{:name=>"Tea",
          :link=>
          "https://www.google.com/search?q=Tea&stick=H4sIAAAAAAAAAONgFuLUz9U3MCorTMtV4gAxzZNzKrQE_UpLijJLMvPzgjNTUssTK4sByyY5qioAAAA&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQxA0InAIwHA",
          :image=>true},
        {:name=>"Espresso",
          :link=>
          "https://www.google.com/search?q=Espresso&stick=H4sIAAAAAAAAAONgFuLUz9U3MCorTMtV4gAxk0vSsrUE_UpLijJLMvPzgjNTUssTK4sBwYKq7CoAAAA&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQxA0IngIwHA",
          :image=>true},
        {:name=>"Chocolate",
          :link=>
          "https://www.google.com/search?q=Chocolate&stick=H4sIAAAAAAAAAONgFuLUz9U3MCorTMtV4gAzDcpytAT9SkuKMksy8_OCM1NSyxMriwHR8y5PKgAAAA&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQxA0IoAIwHA",
          :image=>true},
        {:name=>"Cappuccino",
          :link=>
          "https://www.google.com/search?q=Cappuccino&stick=H4sIAAAAAAAAAONgFuLUz9U3MCorTMtV4gAxLc0NjLQE_UpLijJLMvPzgjNTUssTK4sB6b-xkioAAAA&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQxA0IogIwHA",
          :image=>true},
        {:name=>"Latte",
          :link=>
          "https://www.google.com/search?q=Latte&stick=H4sIAAAAAAAAAONgFuLUz9U3MCorTMtVAjMN84pMzbQE_UpLijJLMvPzgjNTUssTK4sBjSmgBisAAAA&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQxA0IpAIwHA",
          :image=>true}],
      :more_related_searches_link=>
        "https://www.google.com/search?q=Coffee&stick=H4sIAAAAAAAAAONgFuLUz9U3MCorTMtVQjC1xLKTrfTT8vNTwIRVcWZKanliZTEAKVBbezAAAAA&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQzToImQIoATAc"},
    :answer_box=>{:type=>"unknow"},
    :organic_results=>
      [{:position=>1,
        :title=>
        "Sip Coffee at These 20 Portland Roasters and Cafes - Eater Portland",
        :link=>"https://pdx.eater.com/maps/20-great-portland-coffee-shops",
        :displayed_link=>
        "https://pdx.eater.com/maps/20-great-portland-coffee-shops",
        :thumbnail=>true,
        :date=>"Sep 20, 2017",
        :snippet=>
        "Sometimes, when you love something, you just keep talking about it. In this case, that would be coffee, coffee people, and coffeeshops. To get up close and personal with Portland coffee, Emily McIntyre, a former barista turned coffee writer and consultant, shares the 20 coffee shops she thinks serve the best ...",
        :sitelinks=>
        {:inline=>
          [{:title=>"Good Coffee",
            :link=>
              "https://pdx.eater.com/maps/20-great-portland-coffee-shops/good-coffee"},
            {:title=>"Sip Coffee at These 20 ...",
            :link=>
              "https://pdx.eater.com/maps/20-great-portland-coffee-shops/either-or"},
            {:title=>"Coava Coffee Brew Bar",
            :link=>
              "https://pdx.eater.com/maps/20-great-portland-coffee-shops/coava-coffee-brew-bar"},
            {:title=>"Courier Coffee",
            :link=>
              "https://pdx.eater.com/maps/20-great-portland-coffee-shops/courier-coffee"}]},
        :related_link=>
        "https://www.google.com/search?q=related:https://pdx.eater.com/maps/20-great-portland-coffee-shops+coffee&tbo=1&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQHwhpMAM"},
      {:position=>2,
        :title=>
        "Downtown Portland's 10 best coffee shops | OregonLive.com - Portland",
        :link=>
        "http://www.oregonlive.com/dining/index.ssf/2017/09/downtown_portlands_10_best_cof.html",
        :displayed_link=>
        "www.oregonlive.com/dining/index.ssf/2017/.../downtown_portlands_10_best_cof.ht...",
        :thumbnail=>true,
        :date=>"Sep 27, 2017",
        :snippet=>
        "There's no shortage of places to get a quick cup of coffee in downtown Portland. But when you're looking for locally roasted beans, a treat-yourself latte or somewhere relaxing to settle in for a couple hours, these 10 downtown coffee shops are for you. ... Portland's pioneering multi ...",
        :cached_link=>
        "http://webcache.googleusercontent.com/search?q=cache:ec8ZBekWxroJ:www.oregonlive.com/dining/index.ssf/2017/09/downtown_portlands_10_best_cof.html+&cd=5&hl=en&ct=clnk&gl=us"},
      {:position=>3,
        :title=>"Home / Barista - Portland",
        :link=>"http://www.baristapdx.com/",
        :displayed_link=>"www.baristapdx.com/",
        :thumbnail=>true,
        :snippet=>"Welcome to Barista.",
        :cached_link=>
        "http://webcache.googleusercontent.com/search?q=cache:OpyWAEWAJ-MJ:www.baristapdx.com/+&cd=6&hl=en&ct=clnk&gl=us",
        :related_link=>
        "https://www.google.com/search?q=related:www.baristapdx.com/+coffee&tbo=1&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQHwh7MAU"},
      {:position=>4,
        :title=>"Coffee - Wikipedia",
        :link=>"https://en.wikipedia.org/wiki/Coffee",
        :displayed_link=>"https://en.wikipedia.org/wiki/Coffee",
        :thumbnail=>true,
        :snippet=>
        "Coffee is a brewed drink prepared from roasted coffee beans, which are the seeds of berries from the Coffea plant. The genus Coffea is native to tropical Africa and Madagascar, the Comoros, Mauritius, and Réunion in the Indian Ocean. The plant was exported from Africa to Arabia and to countries around the world. Coffee ...",
        :sitelinks=>
        {:inline=>
          [{:title=>"History",
            :link=>"https://en.wikipedia.org/wiki/Coffee#History"},
            {:title=>"Cultivation",
            :link=>"https://en.wikipedia.org/wiki/Coffee#Cultivation"},
            {:title=>"Processing",
            :link=>"https://en.wikipedia.org/wiki/Coffee#Processing"},
            {:title=>"Health effects",
            :link=>"https://en.wikipedia.org/wiki/Coffee#Health_effects"}]},
        :related_link=>
        "https://www.google.com/search?q=related:https://en.wikipedia.org/wiki/Coffee+coffee&tbo=1&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQHwiBATAG"},
      {:position=>5,
        :title=>"Heart Coffee Roasters - Portland",
        :link=>"https://www.heartroasters.com/",
        :displayed_link=>"https://www.heartroasters.com/",
        :thumbnail=>true,
        :snippet=>
        "Heart is a café, roaster & bustling destination point located in Portland, Oregon.",
        :related_link=>
        "https://www.google.com/search?q=related:https://www.heartroasters.com/+coffee&tbo=1&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQHwiMATAH"},
      {:position=>6,
        :title=>"Coava Coffee Roasters - Coffee Roaster, Subscriptions, Shop",
        :link=>"https://coavacoffee.com/",
        :displayed_link=>"https://coavacoffee.com/",
        :thumbnail=>true,
        :snippet=>
        "Coava Coffee Roasters: Highest quality, specialty coffee roasted fresh to order; coffee subscriptions, brew tips, buy coffee online, Portland & San Diego cafes.",
        :related_link=>
        "https://www.google.com/search?q=related:https://coavacoffee.com/+coffee&tbo=1&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQHwiSATAI"},
      {:position=>7,
        :title=>"Water Avenue Coffee - Portland",
        :link=>"https://wateravenuecoffee.com/",
        :displayed_link=>"https://wateravenuecoffee.com/",
        :thumbnail=>true,
        :snippet=>"Roaster and coffee bars located in Portland, Oregon.",
        :related_link=>
        "https://www.google.com/search?q=related:https://wateravenuecoffee.com/+coffee&tbo=1&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQHwiYATAJ"},
      {:position=>8,
        :title=>
        "16 Places in Portland to Drink Coffee Right Now | Portland Monthly",
        :link=>
        "https://www.pdxmonthly.com/articles/2017/2/20/16-places-in-portland-to-drink-coffee-right-now",
        :displayed_link=>
        "https://www.pdxmonthly.com/.../2/.../16-places-in-portland-to-drink-coffee-right-now",
        :thumbnail=>true,
        :date=>"Feb 20, 2017",
        :snippet=>
        "Northeast's Roseway hood was a coffee wasteland until BFFs Marten Boyden and Austin Roberts opened this bright, spartan café in 2016. Now neighbors clamor for the chatty pair's exuberant yet balanced roasts—consumed via drip, via pour-over, or prepped on the café's Rocket R9 (plus, heady, ...",
        :related_link=>
        "https://www.google.com/search?q=related:https://www.pdxmonthly.com/articles/2017/2/20/16-places-in-portland-to-drink-coffee-right-now+coffee&tbo=1&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQHwieATAK"},
      {:position=>9,
        :title=>"Products | Portland Roasting Coffee",
        :link=>"https://portlandroastingcoffee.com/shop/",
        :displayed_link=>"https://portlandroastingcoffee.com/shop/",
        :thumbnail=>true,
        :snippet=>
        "Our Holiday Blend is currently on sale, and we are so excited about this coffee! It's a blend created from Fair Trade Organic coffees from Sumatra and Peru. The light chocolatey flavors of the Peru marry beautifully with the heavier, spicier Sumatra to give a balanced cup of coffee that brings to mind all the traditional tastes of ...",
        :related_link=>
        "https://www.google.com/search?q=related:https://portlandroastingcoffee.com/shop/+coffee&tbo=1&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQHwilATAL"},
      {:position=>10,
        :title=>"Bulletproof Coffee: Debunking the Hot Buttered Hype - Gizmodo",
        :link=>
        "https://gizmodo.com/bulletproof-coffee-debunking-the-hot-buttered-hype-1681321467",
        :displayed_link=>
        "https://gizmodo.com/bulletproof-coffee-debunking-the-hot-buttered-hype-1681321467",
        :thumbnail=>true,
        :snippet=>
        "People are putting butter in their coffee. And hey, if you're just craving a new flavor experience, more power to you. The problem is that Bulletproof Coffee, the company behind the trend, is claiming that drinking a mug of fatty joe every morning instead of eating breakfast is a secret shortcut to weight loss and ..."},
      {:position=>11,
        :title=>"Health effects of coffee: Where do we stand? - CNN - CNN.com",
        :link=>"http://www.cnn.com/2015/08/14/health/coffee-health/index.html",
        :displayed_link=>"www.cnn.com/2015/08/14/health/coffee-health/index.html",
        :thumbnail=>true,
        :snippet=>
        "The verdict on coffee is mostly positive these days, but it hasn't always been so well-received."},
      {:position=>12,
        :title=>"The Case for Drinking as Much Coffee as You Like - The Atlantic",
        :link=>
        "https://www.theatlantic.com/health/archive/2012/11/the-case-for-drinking-as-much-coffee-as-you-like/265693/",
        :displayed_link=>
        "https://www.theatlantic.com/health/archive/2012/11/the-case-for...coffee.../265693/",
        :thumbnail=>true,
        :snippet=>
        "\"What I tell patients is, if you like coffee, go ahead and drink as much as you want and can,\" says Dr. Peter Martin, director of the Institute for Coffee Studies at Vanderbilt University. He's even developed a metric for monitoring your dosage: If you are having trouble sleeping, cut back on your last cup of the ..."}],
    :related_place_searches=>
      [{:query=>"Best coffee",
        :link=>
        "https://www.google.com/search?tbm=lcl&q=coffee&rflfq=1&num=20&uule=w+CAIQICIdUG9ydGxhbmQsT3JlZ29uLFVuaXRlZCBTdGF0ZXM&stick=H4sIAAAAAAAAAB2QPU4FQQyD9RqERLlUW3GExInz03IV9F5LAQfjXJwCL9JoNZuJnc95fjqPADfTsqqrbdwS57FdUWE92Fz6GOt8dZt2bw8UbRLDblWbZhYz-g7TyY3zyKypiJHHIquBPY8J75GDpMXRzB7pg5YeQzplAkaEqv-iiVkQQkmHCUsOs4NkCyZ2CmqtdGMjhQnbRFMJOuBQ02UqaqFcraHnQpVHiSJt_3NlCuz6MRqW2K3zAIcgU8CFNrldWOoYU_zNRiuVzV62ei7rVFRGp7elYM0KTrFrCtdzRsWNLddqdYyXyC6A9d3WLKDcdPcLVmtSxJEEWqMWW_y53X5vL-_3r--3j8_H437_AzjouLbCAQAA&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQ_KoBCL4BMA8",
        :snippet=>"Spella Caffe, Courier Coffee, and 18 more"},
      {:query=>"Coffee and Wi-Fi",
        :link=>
        "https://www.google.com/search?tbm=lcl&q=coffee&rflfq=1&num=20&uule=w+CAIQICIdUG9ydGxhbmQsT3JlZ29uLFVuaXRlZCBTdGF0ZXM&stick=H4sIAAAAAAAAAB2QO2okQRBEGUfIXBhZbc0FBPmLzAx7Ya-wtkASyJGupnPpFIoeaKN5VRX5Ih8fjmsyogiWFwIwNz-evMsNE-VrYawYhGjCynMBx-oAmSk6MLMUMFuUA8zjWtXbmZs2jOqJ4HHd9Fn3qdjGltWs3lcJlxEGCyLIPq5hGVybKnh0FlmngIW3oCKRUz52pxLs6PZsRZ9JCuB0tqZvUPXUQ_BJpWytoUoTIylbnnRHVp6hk5UcZhTAZLsi9BnOsSaIJuXoTQ-Nb8MpELow3GyTi-vfddWsw3G6o0GvvZelk4PaiNaqqZj7CkZr0mvNGwJax0ljk7sSCRXRYhvfl8vP5c_fr_f3t7fby-fr7f_H87-PX-Xyw1HIAQAA&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQ_KoBCMABMBA",
        :snippet=>"Floyd's Coffee Shop Old Town, Peet's Coffee, and 18 more"},
      {:query=>"Espresso bars",
        :link=>
        "https://www.google.com/search?tbm=lcl&q=coffee&rflfq=1&num=20&uule=w+CAIQICIdUG9ydGxhbmQsT3JlZ29uLFVuaXRlZCBTdGF0ZXM&stick=H4sIAAAAAAAAABVQO04EUQzTNoiGaqim4ghO4vwOwEFAogbtXIxzcQq80nspLMex_fx0vhoZ1sQmEr7puyU04FZorjOjaQ0KTYvtYUX2erlHhNBOADGjOUnL3DiP8FwSrOpqjIEuatGQ7bSBY-mdfh4-MzsobbdVh3EeDhxpvROFWKlam1RlKHejc5jgaGq_9nGzTLK12zJ_HiJtWQX0JKQsAttsJ2F02V1vivlqiqG0yZBjyWOV6rAhUzQP0LxrYKIiSJURExguLB6n1JoqsM1pydTECqSKhWd5lSKrmnqEGk9vfbnqiTSM_95uf7eX9-vn_nVd32-fH_frH7EwfhqYAQAA&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQ_KoBCMIBMBE",
        :snippet=>"Caffè Umbria, Water Avenue Coffee, and 16 more"},
      {:query=>"College hangouts",
        :link=>
        "https://www.google.com/search?tbm=lcl&q=coffee&rflfq=1&num=20&uule=w+CAIQICIdUG9ydGxhbmQsT3JlZ29uLFVuaXRlZCBTdGF0ZXM&stick=H4sIAAAAAAAAAB1QO04dURTTa6KUKJNqKpZw7POvWQnFExQIioR9sS5WEU-qe2X5d_zzx_kbjGqOzzLp5QHaeTAnmRkDFNsIukBz7lhHJCjmbpzHOFqsDk7lhEXPeWyXrKyHG5sYy1KSpwV8MpEzxnSXaURNuY_Y-78KV1RLG6u0jWYLs7lQ32CxCl7KC1vZHurtasR2ujflo_6-25AYVWYoZfSl1yGl_gpK70BbXCgt0TtepgDoD93qlc1CmM7XP2RwJFSUtaGDdmWUuPRyyO0uFSHZEko_Ws01yerBBcoUGaidXVdZm9Ia5y-HmbWopZVYc91UgxhOLoa4tmZ-3W7ft4enj7e3-8v98fX5_eXj8--ff74Ol4PCAQAA&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQ_KoBCMQBMBI",
        :snippet=>
        "Stumptown Coffee Roasters, Revolución Coffee House, and 18 more"},
      {:query=>"Tea houses",
        :link=>
        "https://www.google.com/search?tbm=lcl&q=coffee&rflfq=1&num=20&uule=w+CAIQICIdUG9ydGxhbmQsT3JlZ29uLFVuaXRlZCBTdGF0ZXM&stick=H4sIAAAAAAAAABVQu00FQQzUSxAi5IguogTbY3vsPmiA4ElkBE_0RV1UwZy02s9ofuvnp_PNrWysyzYZZITNnq86sNGeDXfvQoqZzY2aBibYETMQ2ikLRvpYyCRYcaH06nFaRNOSgxKKsHLuoGWfrrufB1Kuu2BNluVoP49YOmlW1Y7Ky0_6y0lwiMd1eNLOQ2pkVhABMGAXKAlFVGxlqgKG0tdcC8iY5HbpcR7qo9r6j6uTiilQeobqb62lR5pjrvxMagTieINbxVTUdM-4GDDfmJi6hoUttYTbBjUfDWFEXd9dFdzMwRjHf2-3v9vLx_3z_ev753F__ANhaY9IlAEAAA&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQ_KoBCMYBMBM",
        :snippet=>
        "World Cup Coffee & Tea @ Powell's, Red Robe Tea House & Cafe, and 16 more"},
      {:query=>"Quiet cafes",
        :link=>
        "https://www.google.com/search?tbm=lcl&q=coffee&rflfq=1&num=20&uule=w+CAIQICIdUG9ydGxhbmQsT3JlZ29uLFVuaXRlZCBTdGF0ZXM&stick=H4sIAAAAAAAAACVQy0lFURDjbURw53N1V5YwmX_KsAQRBddqX9ZlFeYqHA7zSzKT25vjASi2uXlVdVkOdlSdNowlPIxEdK0dV3pFZvmER4xao6LXlsC5QPuYC3JcB-CWIT126ZNhIk2CHI26N0wx_LhmdzqTaYypjV7hyWCjw_Ss0P9KHMwor0ZUogciDdfAUEALJhTjuM-me6GCs-zpPjnN2lEdSV1K5O65U87QhZXasGpSStVa7RQVu-50ozgDZjax3VbtvdWnetSuvo6dimjmHNcVQPfI1YEDOpcaXeXGMRpdvML9eQL5XJJIT5izqVW3K7V-xMolWa7e9-Xyc7l7-np__Xx8eX57_fgFgFn1h70BAAA&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQ_KoBCMgBMBQ",
        :snippet=>"Café Ponté, Nuvrei, and 18 more"},
      {:query=>"Coffee shops",
        :link=>
        "https://www.google.com/search?tbm=lcl&q=coffee&rflfq=1&num=20&uule=w+CAIQICIdUG9ydGxhbmQsT3JlZ29uLFVuaXRlZCBTdGF0ZXM&stick=H4sIAAAAAAAAAB2RPU6mQQyD9TWIgu6leqs9QuI4f_WeBUQHEhfbc-0p8NCMRiPHfpx5frqvnfDZAbPdJnYK96vHEoUqj2qCtln31QGHRJ4z7R4xR9ppZjGjc5KeuXFfgVzSWNXVmjBCUV1RYT1YbvqYTF_lJ6_2QKUNMdl9X2RNKUDqBauBvS-R9kgrUeXIvefMa8w0u2y0hDZ7CqTRYzIPrCEjDtUCSl46E5nm5pKS8j0V5YRN7B6sopwbFCbkjU41QM4ZpCgKbVpHnCxdypoizWh6G_X6iz0xi4Rq02F6Ta22hxWpYgUcLjnA0ltfUabNS9S_YOu7rTSghLrr-Pd4_H-8_P18f397-_P98fn1_QMPU7xVxAEAAA&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQ_KoBCMoBMBU",
        :snippet=>"Deadstock Coffee, Barista, and 18 more"}],
    :related_searches=>
      [{:query=>"barista coffee portland",
        :link=>
        "https://www.google.com/search?q=barista+coffee+portland&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQ1QIIzAEoAA"},
      {:query=>"best coffee roasters in portland",
        :link=>
        "https://www.google.com/search?q=best+coffee+roasters+in+portland&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQ1QIIzQEoAQ"},
      {:query=>"coava coffee roasters portland or",
        :link=>
        "https://www.google.com/search?q=coava+coffee+roasters+portland+or&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQ1QIIzgEoAg"},
      {:query=>"stumptown coffee roasters portland or",
        :link=>
        "https://www.google.com/search?q=stumptown+coffee+roasters+portland+or&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQ1QIIzwEoAw"},
      {:query=>"best coffee in portland oregon",
        :link=>
        "https://www.google.com/search?q=best+coffee+in+portland+oregon&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQ1QII0AEoBA"},
      {:query=>"either or coffee",
        :link=>
        "https://www.google.com/search?q=either+or+coffee&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQ1QII0QEoBQ"},
      {:query=>"courier coffee portland",
        :link=>
        "https://www.google.com/search?q=courier+coffee+portland&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQ1QII0gEoBg"},
      {:query=>"award winning coffee portland",
        :link=>
        "https://www.google.com/search?q=award+winning+coffee+portland&sa=X&ved=0ahUKEwjlmrWVxKbYAhXhqlQKHQvgCvoQ1QII0wEoBw"}],
    :pagination=>
      {:current=>1,
      :next=>
        "https://www.google.com/search?q=coffee&ei=wKZBWuW6GOHV0gKLwKvQDw&start=10&sa=N",
      :other_pages=>
        {:"2"=>
          "https://www.google.com/search?q=coffee&ei=wKZBWuW6GOHV0gKLwKvQDw&start=10&sa=N",
        :"3"=>
          "https://www.google.com/search?q=coffee&ei=wKZBWuW6GOHV0gKLwKvQDw&start=20&sa=N",
        :"4"=>
          "https://www.google.com/search?q=coffee&ei=wKZBWuW6GOHV0gKLwKvQDw&start=30&sa=N",
        :"5"=>
          "https://www.google.com/search?q=coffee&ei=wKZBWuW6GOHV0gKLwKvQDw&start=40&sa=N",
        :"6"=>
          "https://www.google.com/search?q=coffee&ei=wKZBWuW6GOHV0gKLwKvQDw&start=50&sa=N",
        :"7"=>
          "https://www.google.com/search?q=coffee&ei=wKZBWuW6GOHV0gKLwKvQDw&start=60&sa=N",
        :"8"=>
          "https://www.google.com/search?q=coffee&ei=wKZBWuW6GOHV0gKLwKvQDw&start=70&sa=N",
        :"9"=>
          "https://www.google.com/search?q=coffee&ei=wKZBWuW6GOHV0gKLwKvQDw&start=80&sa=N",
        :"10"=>
          "https://www.google.com/search?q=coffee&ei=wKZBWuW6GOHV0gKLwKvQDw&start=90&sa=N"}}}