require 'rails_helper'

describe 'Stocks API' do
  describe 'GET /index' do
    let!(:stocks) { create_list(:stock, 2) }
    let(:stock) { stocks.first }

    before { get '/api/v1/stocks', params: { format: :json }}

    it 'returns 200 status' do
      expect(response).to be_success
    end

    it 'returns list of stocks' do
      expect(response.body).to have_json_size(2)
    end

    %w(id name created_at updated_at).each do |attr|
      it "stock object contains #{attr}" do
        expect(response.body).to be_json_eql(stock.send(attr.to_sym).to_json).at_path("0/#{attr}")
      end
    end
  end
end