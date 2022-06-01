require 'rails_helper'

RSpec.describe 'subscription request' do
  it 'can subscribe a customer to a tea subscription' do
    customer = create(:customer)
    tea = create(:tea)
    subscription_params = {
      customer_id: customer.id,
      tea_id: tea.id,
      title: tea.title,
      price: 6.90,
      status: 'active',
      frequency: 'annually'
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post api_v1_subscriptions_path, headers: headers, params: subscription_params.to_json
    # subscription = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
  end
end
