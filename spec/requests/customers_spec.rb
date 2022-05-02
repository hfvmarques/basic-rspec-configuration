require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  describe 'GET /customers' do
    it 'gets all customers' do
      get customers_path

      expect(response).to have_http_status(200)
    end

    it 'gets a customer' do
      customer = create(:customer)
      get customer_path(customer)

      expect(response).to have_http_status(200)
    end

    it 'gets all customers as JSON' do
      get '/customers.json'
      
      expect(response).to have_http_status(200)
      expect(response.body).to include_json([
        name: "Shera Sherail",
        email: "shera@sherail.com"      
      ])
    end
  end
end
