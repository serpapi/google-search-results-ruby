require_relative '../lib/google_search_results'

describe "Account API" do

  before(:all) do
    GoogleSearchResults.serp_api_key = ENV['SERPAPI_KEY']
  end
  
  it 'example' do
    gsr = GoogleSearchResults.new
    account_info = gsr.get_account

    expect(account_info.keys.size).to be > 5
    expect(account_info[:account_id]).not_to be_empty
    expect(account_info[:api_key]).not_to be_empty
    expect(account_info[:account_email]).not_to be_empty
  end

end