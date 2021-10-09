require_relative '../lib/search/yahoo_search'

describe "Yahoo Search API" do

  before(:all) do
    YahooSearch.api_key = ENV['API_KEY']
    @search = YahooSearch.new(p: "Coffee")
  end

  it 'get_hash' do
    hash = @search.get_hash
    expect(hash[:search_metadata][:status]).to eq('Success')
   # expect(hash[:search_metadata][:bing_url]).to match(/www.bing.com/)
    expect(hash[:organic_results].size).to be >4
    expect(hash[:organic_results].to_s).to match /coffee/i
    #expect(hash[:ads].size).to be >5
  end

  it 'get_json' do
    json = @search.get_json
    expect(json.size).to be > 9000
    expect(json).to match /coffee/i
  end

  it 'get_html' do
    expect(@search.get_html).to match /coffee/i
  end
end