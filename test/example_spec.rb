require_relative '../lib/search/google_search'

if ENV['API_KEY'] && GOOGLE_ENGINE == 'google'
  
GoogleSearch.api_key = ENV['API_KEY']

describe 'Search Google Images' do

  it 'this script prints all the images links and download.' do
    search = GoogleSearch.new(q: 'coffee', tbm: "isch")
    image_results_list = search.get_hash[:images_results]
    image_results_list.each_with_index do |image_result, index|
      next if image_result.nil?
      puts " #{index}> #{image_result[:original]}"
      # to download the image:
      # `wget #{image_result[:original]}`
    end
  end

end

describe 'Search Google shop' do

  it 'this script prints the first 3 pages of the news title for the last 24h' do
    search = GoogleSearch.new({
      q: 'coffee', # search query
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
  end

end

describe 'Search Google Shopping' do

  it 'this script prints all the shopping results order by review order with position' do
    search = GoogleSearch.new({
      q: 'coffee', # search query
      tbm: "shop", # shopping
      tbs: "tbs=p_ord:rv" # by best review
    })
    shopping_results_list = search.get_hash[:shopping_results]
    shopping_results_list.each do |shopping_result|
      puts "#{shopping_result[:position]} - #{shopping_result[:title]}"
    end
  end

end

describe 'Search Google By Location' do

  it 'this search shows the top coffee result per location.' do
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
  end

end

describe 'Batch Asynchronous search' do

  it 'run a batch of news search against a list of popular technology company.' do
    if ENV['API_KEY'].nil?
      skip("no API_KEY provided")
    end

    company_list = %w(microsoft apple nvidia)
  
    puts "submit batch asynchronous search"
    search = GoogleSearch.new({async: true, q: company_list.first })

    search_queue = Queue.new
    company_list.each do |company|
      # set query
      search.params[:q] = company

      # store request into a search_queue
      search_result = search.get_hash()
      if search_result[:search_metadata][:status] =~ /Cached|Success/
        puts "#{company}: search done"
        next
      end

      # add search to the search_queue
      search_queue.push(search_result)
    end

    puts 'wait until all searches are cached or success'
    search = GoogleSearch.new
    until search_queue.empty?
      search_result = search_queue.pop
      # extract search id
      search_id = search_result[:search_metadata][:id]

      # retrieve search from the archive
      search_archived =  search.get_search_archive(search_id)
      if search_archived[:search_metadata][:status] =~ /Cached|Success/
        puts "#{search_archived[:search_parameters][:q]}: search done"
        next
      end

      # add back the search
      search_queue.push(search_result)
    end

    #work only with Ruby >2.5
    #search_queue.close
    puts 'all searches completed'
  end

end

end
