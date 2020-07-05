require_relative '../lib/google_search_results'

describe "Search Archive API" do

  before(:all) do
    GoogleSearchResults.api_key = ENV['API_KEY']
  end
  
  it 'example' do
    # mock 
    search_response_mock =  %q({
        "search_metadata": {
          "id": "cdbdbdebeabab1beb"
        }
      })

    # run a search
    search = GoogleSearchResults.new(q: "Coffee", location: "Portland")

    if search.api_key.nil?
      allow(search).to receive(:get_results) { search_response_mock }
    end
    original_search = search.get_hash

    search_id = original_search[:search_metadata][:id]
    expect(search_id).not_to be_empty

    # retrieve search from archive
    search = GoogleSearchResults.new({})
    if search.api_key.nil?
      allow(search).to receive(:get_results) { search_response_mock }
    end
    archive_search = search.get_search_archive(search_id)
  
    expect(archive_search).to eq(original_search)
  end

end