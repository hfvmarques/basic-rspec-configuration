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
        id: /\d/,
        name: (be_kind_of String),
        email: (be_kind_of String)      
      ])
    end

    it 'gets a customer as JSON' do
      customer = create(:customer)
      get "/customers/#{customer.id}.json"
      
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(
        id: /\d/,
        name: (be_kind_of String),
        email: (be_kind_of String)      
      )
    end

    it 'show - RSpec puro + JSON' do
      customer = create(:customer)
      get "/customers/#{customer.id}.json"
      
      response_body = JSON.parse(response.body)
      expect(response_body.fetch("name")).to eq customer.name
    end
  end

  # describe 'POST /customers' do
    
  #   it 'create a customer as JSON' do
  #     member = create(:member)
  #     login_as(member, scope: :member)
      
  #     headers = { "ACCEPT" => "application/json" }
  
  #     customer_params = attributes_for(:customer)
      
  #     post "/customers.json", params: { customer: customer_params }, headers: headers

  #     expect(response).to have_http_status(201)
  #   end
  # end
end
