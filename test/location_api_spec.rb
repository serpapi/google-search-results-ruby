require_relative '../lib/google_search_results'

describe "Location API" do

  before(:all) do
    GoogleSearchResults.api_key = nil
  end
  
  it 'example' do
    search = GoogleSearchResults.new(q: "Austin", limit: 3) 
    location_list = search.get_location
    expect(location_list.size).to eq(3)

    first = location_list.first
    expect(first[:id]).to  eq('585069bdee19ad271e9bc072')
    expect(first[:name]).to eq("Austin, TX")
    expect(first[:country_code]).to eq("US")
    expect(first[:target_type]).to eq("DMA Region")
    expect(first[:reach]).to eq(5560000)
    expect(first[:gps]).to eq([-97.7430608, 30.267153])
    expect(first[:keys]).to eq(["austin", "tx", "texas", "united", "states"])
    expect(first[:canonical_name]).to eq("Austin,TX,Texas,United States")

    if search.engine == 'google'
      expect(first[:google_id]).to eq(200635)
      expect(first[:google_parent_id]).to eq(21176)
    end
  end

end