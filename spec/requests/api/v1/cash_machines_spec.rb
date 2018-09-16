require 'rails_helper'

RSpec.describe 'Cash Machines API', type: :request do

  let!(:cash_machines) { create_list(:cash_machine, 10) }
  let(:location) { {lat: Random.new.rand(55.559700 .. 55.913810), long: Random.new.rand(37.326050 .. 37.891850)} }

  context "valid request" do
    describe 'GET /api/v1/cash_machines/search?lat&long with valid params' do
      before { get "/api/v1/cash_machines/search?lat=#{location[:lat]}&long=#{location[:long]}" }

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
    describe 'GET /api/v1/cash_machines/search?lat&long with invalid lat' do
      before { get "/api/v1/cash_machines/search?lat=200&long=#{location[:long]}" }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/"Must be in -90.0 .. 90.0 range"/)
      end      
    end

    describe 'GET /api/v1/cash_machines/search?lat&long with invalid long' do
      before { get "/api/v1/cash_machines/search?lat=#{location[:lat]}&long=200" }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/"Must be in -180.0 .. 180.0 range"/)
      end
    end

    describe 'GET /api/v1/cash_machines/search?bad with wrong query' do
      before { get "/api/v1/cash_machines/search?bad=query" }

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/bad/)
      end
    end    
  end
end