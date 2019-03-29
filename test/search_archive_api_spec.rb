require_relative '../lib/google_search_results'

describe "Search Archive API" do

  before(:all) do
    GoogleSearchResults.serp_api_key = ENV['API_KEY']
  end
  
  it 'example' do
    # mock 
    search_response_mock =  %q({
        "search_metadata": {
          "id": "cdbdbdebeabab1beb"
        }
      })

    # run a search
    client = GoogleSearchResults.new(q: "Coffee", location: "Portland")

    if GoogleSearchResults.serp_api_key.nil?
      allow(client).to receive(:get_results) { search_response_mock }
    end
    original_search = client.get_hash

    search_id = original_search[:search_metadata][:id]
    expect(search_id).not_to be_empty

    # retrieve search from archive
    client = GoogleSearchResults.new
    if GoogleSearchResults.serp_api_key.nil?
      allow(search).to receive(:get_results) { search_response_mock }
    end
    archive_search = client.get_search_archive(search_id)
  
    expect(archive_search).to eq(original_search)
  end

end