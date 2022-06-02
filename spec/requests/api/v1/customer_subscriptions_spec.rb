require 'rails_helper'

RSpec.describe 'customer subscriptions' do
  it 'can show all customer subscriptions' do
    customer = create(:customer)
    tea_1 = create(:tea)
    tea_2 = create(:tea)
    subscription_1 = Subscription.create(customer_id: customer.id,
      tea_id: tea_1.id,
      title: tea_1.title,
      price: 6.90,
      status: :active,
      frequency: :monthly
    )
    subscription_2 = Subscription.create(customer_id: customer.id,
      tea_id: tea_2.id,
      title: tea_2.title,
      price: 4.20,
      status: :active,
      frequency: :weekly
    )

    get api_v1_customer_subscriptions_path(customer)
    subscriptions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(subscriptions).to have_key(:data)
    expect(subscriptions[:data].size).to eq(2)
  end
end
