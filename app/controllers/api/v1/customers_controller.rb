class Api::V1::CustomersController < ApplicationController
  
  def create
    customer = Customer.new(customer_params)
    if customer.save
      render json: CustomerSerializer.new(customer), status: 201
    else
      render json: { error: "unable to create customer" }, status: :bad_request
    end
  end

  private
  def customer_params
    params.permit(:first_name, :last_name, :email, :address)
  end
end
