require 'rails_helper'

RSpec.describe 'cancel subscription request' do
  let(:customer) { create(:customer) }
  let(:tea) { create(:tea) }

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

    patch api_v1_customer_subscription_path(customer, subscription), params: { status: 'canceled' }
    subscription = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response).to have_http_status(200)
    expect(subscription).to be_a(Hash)
    expect(subscription).to have_key(:data)
    expect(subscription[:data][:attributes][:status]).to eq('canceled')
    expect(subscription[:data][:attributes][:status]).to_not eq('active')
  end

  it 'returns an error if cancelation is not properly done' do
    subscription = Subscription.create(
      customer_id: customer.id,
      tea_id: tea.id,
      title: tea.title,
      price: 6.90,
      status: :active,
      frequency: :weekly
    )
    patch api_v1_customer_subscription_path(customer, subscription), params: { status: 'this is not a valid status' }

    expect(response).to_not be_successful
  end
end
