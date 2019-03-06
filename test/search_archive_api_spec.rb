require_relative '../lib/google_search_results'

describe "Search Archive API" do

  before(:all) do
    GoogleSearchResults.serp_api_key = ENV['SERPAPI_KEY']
  end
  
  it 'example' do
    # run a search
    gsr = GoogleSearchResults.new(q: "Coffee", location: "Portland")
    original_search = gsr.get_hash

    search_id = original_search[:search_metadata][:id]
    expect(search_id).not_to be_empty

    # retrieve search from archive
    gsr = GoogleSearchResults.new
    archive_search = gsr.get_search_archive(search_id)
  
    expect(archive_search).to eq(original_search)
  end

end