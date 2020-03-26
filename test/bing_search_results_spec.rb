require_relative '../lib/bing_search_results'

describe "Bing Search API" do

  before(:all) do
    BingSearchResults.serp_api_key = ENV['API_KEY']
    @client = BingSearchResults.new(q: "Coffee", location: "Portland")
  end

  it 'get_hash' do
    hash = @client.get_hash
    expect(hash[:search_metadata][:status]).to eq('Success')
   # expect(hash[:search_metadata][:bing_url]).to match(/www.bing.com/)
    expect(hash[:organic_results].size).to be >5
    expect(hash[:organic_results].to_s).to match /coffee/
    #expect(hash[:ads].size).to be >5
  end

  it 'get_json' do
    json = @client.get_json
    expect(json.size).to be > 9000
    expect(json).to match /coffee/
  end

  it 'get_html' do
    expect(@client.get_html).to match /coffee/
  end
end