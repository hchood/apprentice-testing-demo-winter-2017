require 'rails_helper'

describe 'ArtistsController endpoints' do
  describe 'GET /artists' do
    # status
    # what JSON we got back
    it 'returns JSON for all artists' do
      FactoryGirl.create_list(:artist, 3)

      get(artists_url, {}, {})

      expect(response).to have_http_status :ok
      expect(body).to have_json_path("artists/0")
      expect(body).to have_json_path("artists/0/id")
      expect(body).to have_json_path("artists/0/created_at")
      expect(body).to have_json_path("artists/0/updated_at")
      expect(body).to have_json_path("artists/0/name")
    end
  end

  describe 'GET /artists/:id' do
    it 'returns JSON for a single artist' do
      artist = FactoryGirl.create(:artist)
      FactoryGirl.create_list(:album, 2, artist: artist)

      get(artist_url(artist), {}, {})

      expect(response).to have_http_status :ok
      expect(body).to have_json_path("artist")
      expect(body).to have_json_path("artist/id")
      expect(body).to have_json_path("artist/created_at")
      expect(body).to have_json_path("artist/updated_at")
      expect(body).to have_json_path("artist/name")
      expect(body).to have_json_path("artist/album_ids")
      expect(body).to have_json_size(2).at_path("artist/album_ids")
      expect(body).to have_json_path("albums")
      expect(body).to have_json_size(2).at_path("albums")
      expect(body).to have_json_path("albums/0/id")
      expect(body).to have_json_path("albums/0/created_at")
      expect(body).to have_json_path("albums/0/updated_at")
      expect(body).to have_json_path("albums/0/artist_id")
      expect(body).to have_json_path("albums/0/title")
      expect(body).to have_json_path("albums/0/year")
    end
  end

  describe 'POST /artists' do
    context 'authenticated user' do
      context 'with valid attributes' do
        it 'returns JSON for the new artist' do
          user = FactoryGirl.create(:user)
          headers = { "Authorization" => "Token token=#{user.authentication_token}" }
          artist_attributes = { name: "Leonard Cohen" }

          post(
            artists_url,
            headers,
            artist_attributes.to_json
          )

          expect(response).to have_http_status :created
          # ...
        end
      end

      context 'with invalid attributes' do
        context 'such as missing a name' do
          it 'returns a 422 response with errors'
        end

        context 'such as a duplicate name' do
          it 'returns a 422 response with errors'
        end
      end
    end

    context 'unauthenticated user' do
      it 'returns a 401 response'
    end
  end
end
