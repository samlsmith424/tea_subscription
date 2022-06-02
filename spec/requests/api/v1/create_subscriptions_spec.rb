require 'rails_helper'

RSpec.describe 'subscription request' do
  let(:customer) { create(:customer) }
  let(:tea) { create(:tea) }

  it 'can add a customer to a tea subscription' do
    body = {
      tea_id: tea.id,
      title: tea.title,
      price: 6.90,
      status: :active,
      frequency: :annually
    }

    post api_v1_customer_subscriptions_path(customer), params: body

    subscription = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response).to have_http_status(201)
    expect(subscription).to be_a(Hash)
    expect(subscription).to have_key(:data)
    expect(subscription[:data]).to have_key(:id)
    expect(subscription[:data][:id]).to be_a(String)

    expect(subscription[:data]).to have_key(:type)
    expect(subscription[:data][:type]).to eq("subscription")

    expect(subscription[:data]).to have_key(:attributes)
    expect(subscription[:data][:attributes]).to be_a(Hash)

    expect(subscription[:data][:attributes]).to have_key(:title)
    expect(subscription[:data][:attributes][:title]).to be_a(String)

    expect(subscription[:data][:attributes]).to have_key(:price)
    expect(subscription[:data][:attributes][:price]).to be_a(Float)

    expect(subscription[:data][:attributes]).to have_key(:status)
    expect(subscription[:data][:attributes][:status]).to be_a(String)

    expect(subscription[:data][:attributes]).to have_key(:frequency)
    expect(subscription[:data][:attributes][:frequency]).to be_a(String)
  end

  it 'does not create a subscription if fields are not properly filled' do
    body = {
      customer_id: customer.id,
      tea_id: tea.id,
      title: tea.title,
      price: 'string',
      status: :active,
      frequency: :annually
    }

    post api_v1_customer_subscriptions_path(customer), params: body.to_json

    expect(response).to have_http_status(400)
    expect(JSON.parse(response.body)["error"]).to eq("unable to create subscription")
  end
end
