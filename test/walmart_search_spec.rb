require_relative '../lib/google_search_results'

describe "Walmart Search API Google" do

  before(:all) do
    WalmartSearch.api_key = ENV['API_KEY']
    @search = WalmartSearch.new(query: "Coffee")
  end

  it 'get_hash' do
    hash = @search.get_hash
    expect(hash[:search_metadata][:status]).to eq('Success')
    expect(hash[:search_metadata][:walmart_url]).to match(/walmart/)
    expect(hash[:organic_results].size).to be >= 4
    expect(hash[:organic_results].to_s).to match /coffee/i
    expect(hash[:pagination]).not_to be_empty
  end

  it 'get_json' do
    json = @search.get_json
    expect(json.size).to be > 5000
    expect(json).to match /coffee/i
  end

  it 'get_html' do
    expect(@search.get_html).to match /coffee/i
  end

end
