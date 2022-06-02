require 'rails_helper'

RSpec.describe 'create tea request' do

  it 'can add a customer to a tea subscription' do
    body = {
      title: "Really good tea",
      description: "Actually it is really good",
      temperature: 200,
      brew_time: 4
    }

    post api_v1_teas_path, params: body

    tea = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response).to have_http_status(201)
    expect(tea).to be_a(Hash)
    expect(tea).to have_key(:data)
  end
end
