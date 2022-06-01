require 'rails_helper'

RSpec.describe 'subscription request' do
  let(:customer) { create(:customer) }
  let(:tea) { create(:tea) }

  it 'can add a customer to a tea subscription' do
    params = {
      customer_id: customer.id,
      tea_id: tea.id,
      title: tea.title,
      price: 6.90,
      status: :active,
      frequency: :annually
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post api_v1_subscriptions_path, headers: headers, params: params.to_json
    subscription = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response).to have_http_status(201)
    expect(subscription).to be_a(Hash)
    expect(subscription).to have_key(:data)
  end

  it 'does not create a subscription if fields are not properly filled' do
    params = {
      customer_id: customer.id,
      tea_id: tea.id,
      title: tea.title,
      price: 'string',
      status: :active,
      frequency: :annually
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post api_v1_subscriptions_path, headers: headers, params: params.to_json

    expect(response).to have_http_status(400)
    expect(JSON.parse(response.body)["error"]).to eq("unable to create subscription")
  end

  it 'can cancel a customers tea subscription' do
    subscription = Subscription.create(
      customer_id: customer.id,
      tea_id: tea.id,
      title: tea.title,
      price: 6.90,
      status: :active,
      frequency: :weekly
    )
    expect(subscription.status).to eq('active')

    patch api_v1_subscription_path(subscription), params: { status: 'canceled' }
    subscription = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response).to have_http_status(200)
    expect(subscription).to be_a(Hash)
    expect(subscription).to have_key(:data)
    expect(subscription[:data][:attributes][:status]).to eq('canceled')
    expect(subscription[:data][:attributes][:status]).to_not eq('active')
  end
end
