require 'rails_helper'

RSpec.describe 'Gif Requests' do
  let(:headers) { { 'ACCEPT' => 'application/json' } }

  context 'creating' do
    let(:url) { Faker::Internet.url }
    let(:title) { Faker::Hipster.sentence }

    it 'creates a Gif' do
      post '/gifs', params: { url: url, title: title }, headers: headers

      expect(response.content_type).to eq 'application/json'
      expect(response).to have_http_status :created
      expect(response).to match_response_schema('gif', strict: true)
    end
  end
end
