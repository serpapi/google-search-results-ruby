require_relative '../lib/search/google_search'

describe "Account API" do

  before(:all) do
    GoogleSearch.api_key = ENV['API_KEY']
  end
  
  it 'example' do
    search = GoogleSearch.new

    if ENV['API_KEY'].nil?
      allow(search).to receive(:get_results) {
        %q({
          "account_id": "5ac54d6adefb2f1dba1663f5",
          "api_key": "SECRET_API_KEY",
          "account_email": "demo@serpapi.com",
          "plan_id": "bigdata",
          "plan_name": "Big Data Plan",
          "searches_per_month": 30000,
          "this_month_usage": 24042,
          "last_hour_searches": 42
        })
      }
    end
    account_info = search.get_account

    expect(account_info.keys.size).to be > 5
    expect(account_info[:account_id]).not_to be_empty
    expect(account_info[:api_key]).not_to be_empty
    expect(account_info[:account_email]).not_to be_empty
  end

end