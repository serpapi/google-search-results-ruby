require_relative '../lib/yandex_search_results'

describe "Yandex Search API" do

  before(:all) do
    YandexSearchResults.api_key = ENV['API_KEY']
    @client = YandexSearchResults.new(text: "Coffee")
  end

  it 'get_hash' do
    hash = @client.get_hash
    expect(hash[:search_metadata][:status]).to eq('Success')
   # expect(hash[:search_metadata][:bing_url]).to match(/www.bing.com/)
    expect(hash[:organic_results].size).to be >5
    expect(hash[:organic_results].to_s).to match /coffee/i
    #expect(hash[:ads].size).to be >5
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