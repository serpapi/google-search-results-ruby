require_relative '../lib/search/bing_search'

describe "Bing Search API" do

  before(:all) do
    BingSearch.api_key = ENV['API_KEY']
    @search = BingSearch.new(q: "Coffee", location: "Portland")
  end

  it 'get_hash' do
    hash = @search.get_hash
    expect(hash[:search_metadata][:status]).to eq('Success')
   # expect(hash[:search_metadata][:bing_url]).to match(/www.bing.com/)
    expect(hash[:organic_results].size).to be >= 3
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
