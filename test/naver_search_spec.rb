require_relative '../lib/google_search_results'

describe "Naver Search API" do

  before(:all) do
    @search = NaverSearch.new(query: "Coffee", api_key: ENV['API_KEY'])
  end

  it 'get_hash' do
    hash = @search.get_hash
    expect(hash[:search_metadata][:status]).to eq('Success')
    expect(hash[:ads_results].size).to be >5
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
