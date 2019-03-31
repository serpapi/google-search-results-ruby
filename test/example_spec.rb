require_relative '../lib/google_search_results'

if ENV['API_KEY']
  
GoogleSearchResults.serp_api_key = ENV['API_KEY']

describe 'Search Google Images' do

  it 'this script prints all the images links and download.' do
    client = GoogleSearchResults.new(q: 'coffee', tbm: "isch")
    image_results_list = client.get_hash[:images_results]
    image_results_list.each do |image_result|
      puts ' - ' + image_result[:original]
      # to download the image:
      # `wget #{image_result[:original]}`
    end
  end

end

describe 'Search Google shop' do

  it 'this script prints the first 3 pages of the news title for the last 24h' do
    client = GoogleSearchResults.new({
      q: 'coffee', # search query
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
  end

end

describe 'Search Google Shopping' do

  it 'this script prints all the shopping results order by review order with position' do
    client = GoogleSearchResults.new({
      q: 'coffee', # search query
      tbm: "shop", # shopping
      tbs: "tbs=p_ord:rv" # by best review
    })
    shopping_results_list = client.get_hash[:shopping_results]
    shopping_results_list.each do |shopping_result|
      puts "#{shopping_result[:position]} - #{shopping_result[:title]}"
    end
  end

end

describe 'Search Google By Location' do

  it 'this search shows the top coffee result per location.' do
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
  end

end

describe 'Batch Asynchronous search' do

  it 'run a batch of news search against a list of popular technology company.' do
    if ENV['API_KEY'].nil?
      skip("no API_KEY provided")
    end

    company_list = %w(microsoft apple nvidia)
  
    puts "submit batch asynchronous search"
    client = GoogleSearchResults.new({async: true})

    search_queue = Queue.new
    company_list.each do |company|
      # set query
      client.params[:q] = company

      # store request into a search_queue
      client = client.get_hash()
      if search[:search_metadata][:status] =~ /Cached|Success/
        puts "#{company}: search done"
        next
      end

      # add search to the search_queue
      search_queue.push(search)
    end

    puts "wait until all searches are cached or success"
    client = GoogleSearchResults.new
    while !search_queue.empty?
      client = search_queue.pop
      # extract search id
      search_id = search[:search_metadata][:id]

      # retrieve search from the archive
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
  end

end

end