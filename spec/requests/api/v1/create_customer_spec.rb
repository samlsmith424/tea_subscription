require 'rails_helper'

RSpec.describe 'create customer request' do

  it 'can add a customer to a customer subscription' do
    body = {
      first_name: "Britney",
      last_name: "Spears",
      email: "email@email.com",
      address: "Somewhere in Los Angeles"
    }

    post api_v1_customers_path, params: body

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response).to have_http_status(201)
    expect(customer).to be_a(Hash)
    expect(customer).to have_key(:data)
    expect(customer[:data]).to have_key(:id)
    expect(customer[:data][:id]).to be_a(String)

    expect(customer[:data]).to have_key(:type)
    expect(customer[:data][:type]).to eq("customer")

    expect(customer[:data]).to have_key(:attributes)
    expect(customer[:data][:attributes]).to be_a(Hash)

    expect(customer[:data][:attributes]).to have_key(:first_name)
    expect(customer[:data][:attributes][:first_name]).to be_a(String)

    expect(customer[:data][:attributes]).to have_key(:last_name)
    expect(customer[:data][:attributes][:last_name]).to be_a(String)

    expect(customer[:data][:attributes]).to have_key(:email)
    expect(customer[:data][:attributes][:email]).to be_a(String)

    expect(customer[:data][:attributes]).to have_key(:address)
    expect(customer[:data][:attributes][:address]).to be_a(String)
  end

  it 'returns an error if all input values are not present' do
    body = {
      first_name: "Britney",
      last_name: "Spears",
      email: "email@email.com"
    }

    post api_v1_customers_path, params: body


    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(JSON.parse(response.body)["error"]).to eq("unable to create customer")
  end
end
