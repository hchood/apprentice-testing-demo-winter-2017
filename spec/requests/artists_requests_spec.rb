require 'rails_helper'

describe 'ArtistsController endpoints' do
  describe 'GET /artists' do
    # status
    # what JSON we got back
    it 'returns JSON for all artists' do
      artists = FactoryGirl.create_list(:artist, 3)

      get(artists_url, {}, {})

      expect(response).to have_http_status :ok
      expect(body).to have_json_path("artists/0")
      expect(body).to have_json_path("artists/0/id")
      expect(body).to have_json_path("artists/0/created_at")
      expect(body).to have_json_path("artists/0/updated_at")
      expect(body).to have_json_path("artists/0/name")
    end
  end
end
