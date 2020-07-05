require_relative '../lib/google_search_results'

describe "Google Search API Google" do

  before(:all) do
    SerpApiClient.api_key = ENV['API_KEY']
    @search = SerpApiClient.new({q: "Coffee", location: "Portland",  engine: "google"})
  end

  it 'get_hash' do
    hash = @search.get_hash
    expect(hash[:organic_results].to_s).to match /coffee/i
  end

  it 'get_json' do
    json = @search.get_json
    expect(json.size).to be > 10000
    expect(json).to match /coffee/i
  end

  it 'get_html' do
    expect(@search.get_html).to match /coffee/i
  end

end

describe 'low level' do

  it 'construct_url' do
    SerpApiClient.api_key = nil
    search = SerpApiClient.new({q: "Coffee", location: "Portland", serp_api_key: nil}, 'google')
    expect(search.construct_url('/search').to_s).to eq("https://serpapi.com/search?q=Coffee&location=Portland&engine=google&source=ruby")
  end

  it 'construct_url' do
    search = SerpApiClient.new({q: "Coffee", location: "Portland", serp_api_key: 'hello_world'}, 'google')
    expect(search.construct_url('/search').to_s).to eq("https://serpapi.com/search?q=Coffee&location=Portland&serp_api_key=hello_world&engine=google&source=ruby")
  end

end
