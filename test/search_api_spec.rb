require_relative '../lib/google_search_results'

describe "Google Search API Google" do

  before(:all) do
    GoogleSearchResults.serp_api_key = ENV['API_KEY']
    @client = GoogleSearchResults.new(q: "Coffee", location: "Portland")
  end

  it 'get_hash' do
    hash = @client.get_hash
    expect(hash[:organic_results].to_s).to match /coffee/
  end

  it 'get_json' do
    json = @client.get_json
    expect(json.size).to be > 10000
    expect(json).to match /coffee/
  end

  it 'get_html' do
    expect(@client.get_html).to match /coffee/
  end

end

describe 'low level' do

  it 'construct_url' do
    GoogleSearchResults.serp_api_key = nil
    client = GoogleSearchResults.new(q: "Coffee", location: "Portland", serp_api_key: nil)
    expect(client.construct_url('/search').to_s).to eq("https://serpapi.com/search?q=Coffee&location=Portland&engine=google&source=ruby")
  end

  it 'construct_url' do
    client = GoogleSearchResults.new(q: "Coffee", location: "Portland", serp_api_key: 'hello_world')
    expect(client.construct_url('/search').to_s).to eq("https://serpapi.com/search?q=Coffee&location=Portland&serp_api_key=hello_world&engine=google&source=ruby")
  end

end
