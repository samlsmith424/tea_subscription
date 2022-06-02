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
    expect(tea[:data]).to have_key(:id)
    expect(tea[:data][:id]).to be_a(String)

    expect(tea[:data]).to have_key(:type)
    expect(tea[:data][:type]).to eq("tea")

    expect(tea[:data]).to have_key(:attributes)
    expect(tea[:data][:attributes]).to be_a(Hash)

    expect(tea[:data][:attributes]).to have_key(:title)
    expect(tea[:data][:attributes][:title]).to be_a(String)

    expect(tea[:data][:attributes]).to have_key(:description)
    expect(tea[:data][:attributes][:description]).to be_a(String)

    expect(tea[:data][:attributes]).to have_key(:temperature)
    expect(tea[:data][:attributes][:temperature]).to be_a(Integer)

    expect(tea[:data][:attributes]).to have_key(:brew_time)
    expect(tea[:data][:attributes][:brew_time]).to be_a(Integer)
  end

  it 'returns an error if all input values are not present' do
    body = {
      description: "Actually it is really good",
      temperature: 200,
      brew_time: 4
    }

    post api_v1_teas_path, params: body

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(JSON.parse(response.body)["error"]).to eq("unable to create tea")
  end
end
