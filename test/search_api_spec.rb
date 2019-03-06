require_relative '../lib/google_search_results'

describe "Search API" do

  before(:all) do
    GoogleSearchResults.serp_api_key = ENV['SERPAPI_KEY']
    @gsr = GoogleSearchResults.new(q: "Coffee", location: "Portland")
  end

  it 'get_hash' do
    hash = @gsr.get_hash
    expect(hash.keys.size).to eq(10)
    expect(hash.to_s).to match /coffee/
  end

  it 'get_json' do
    json = @gsr.get_json
    expect(json.size).to be > 10000
    expect(json).to match /coffee/
  end

  it 'get_html' do
    expect(@gsr.get_html).to match /coffee/
  end

end

describe 'low level' do

  it 'construct_url' do
    GoogleSearchResults.serp_api_key = nil
    gsr = GoogleSearchResults.new(q: "Coffee", location: "Portland", serp_api_key: nil)
    expect(gsr.construct_url('/search').to_s).to eq("https://serpapi.com/search?q=Coffee&location=Portland&source=ruby")
  end

  it 'construct_url' do
    gsr = GoogleSearchResults.new(q: "Coffee", location: "Portland", serp_api_key: 'hello_world')
    expect(gsr.construct_url('/search').to_s).to eq("https://serpapi.com/search?q=Coffee&location=Portland&serp_api_key=hello_world&source=ruby")
  end

end
