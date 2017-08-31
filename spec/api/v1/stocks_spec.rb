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

  describe "POST /create" do

    describe "with valid attributes", js: true do
      let!(:stock_params) { attributes_for(:stock) }

      subject { post '/api/v1/stocks', params: {stock: stock_params, format: :json }}

      it 'returns 200 status' do
        subject
        expect(response).to be_success
      end

      it 'saves the new stock to database' do
        expect { subject }.to change(Stock, :count).by(1)
      end

      %w{name}.each do |attr|
        it "stock object contains #{attr}" do
          subject
          expect(response.body).to be_json_eql(stock_params[attr.to_sym].to_json).at_path("#{attr}")
        end
      end
    end

    describe "with invalid attributes" do
      subject { post '/api/v1/stocks', params: {stock: {name: nil}, format: :json }}

      it 'returns 422 status' do
        subject
        expect(response).to have_http_status(422)
      end

      it 'returns an error message' do
        subject
        expect(response.body).to be_json_eql(["can't be blank"].to_json).at_path("errors/name")
      end

      describe "stock is exists" do
        let!(:stock_name) { "New stock"}

        before do
          create(:stock, name: stock_name)
          post '/api/v1/stocks', params: {stock: {name: stock_name}, format: :json }
        end

        it 'returns 422 status' do
          expect(response).to have_http_status(422)
        end

        it "returns an error message" do
          expect(response.body).to be_json_eql(["has already been taken"].to_json).at_path("errors/name")
        end
      end
    end
  end
end