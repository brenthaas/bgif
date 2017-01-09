require 'rails_helper'

RSpec.describe 'Gif Requests' do
  let(:headers) { { 'ACCEPT' => 'application/json' } }

  context 'creating' do
    let(:url) { Faker::Internet.url }

    it 'creates a Gif' do
      post '/gifs', params: { url: url }, headers: headers

      expect(response.content_type).to eq 'application/json'
      expect(response).to have_http_status :created
    end
  end
end
