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
