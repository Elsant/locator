require 'rails_helper'

RSpec.describe 'Cash Machines API', type: :request do

  let!(:cash_machines) { create_list(:cash_machine, 10) }
  let(:location) { {lat: Random.new.rand(55.559700 .. 55.913810), long: Random.new.rand(37.326050 .. 37.891850)} }

  context "valid request" do
    describe 'GET /api/v1/search?lat&long with valid params' do
      before { req_str = get "/api/v1/search?lat=#{location[:lat]}&long=#{location[:long]}" }

      it 'returns nearest five cash machines' do
        json_data = JSON.parse(response.body)
        expect(json_data).not_to be_empty
        expect(json_data.size).to eq(5)
      end
    
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  context "invalid request" do
  end
end