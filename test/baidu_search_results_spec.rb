require_relative '../lib/baidu_search_results'

describe "Baidu Search API Google" do

  before(:all) do
    BaiduSearchResults.serp_api_key = ENV['API_KEY']
    @client = BaiduSearchResults.new(q: "Coffee")
  end

  it 'get_hash' do
    hash = @client.get_hash
    expect(hash[:search_metadata][:status]).to eq('Success')
    #expect(hash[:search_metadata][:baidu_url]).to match(/www.baidu.com/)
    expect(hash[:organic_results].size).to be >4
    expect(hash[:organic_results].to_s).to match /coffee/i
    # expect(hash[:pagination]).not_to be_empty
  end

  it 'get_json' do
    json = @client.get_json
    expect(json.size).to be > 9000
    expect(json).to match /coffee/i
  end

  it 'get_html' do
    expect(@client.get_html).to match /coffee/i
  end

end
