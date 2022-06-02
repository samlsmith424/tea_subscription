class Api::V1::SubscriptionsController < ApplicationController
  before_action :valid_status, only: [:update]

  def index
    subscriptions = customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions)
  end

  def create
    subscription = Subscription.new(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: 201
    else
      render json: { error: "unable to create subscription" }, status: :bad_request
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    if subscription.update(subscription_params)
      render json: SubscriptionSerializer.new(subscription), status: :ok
    else
      render json: { error: "unable to cancel subscription" }, status: :bad_request
    end
  end

  private
  def subscription_params
    params.permit(:customer_id, :tea_id, :title, :price, :status, :frequency)
  end

  def valid_status
    if params[:status] != "active" && params[:status] != "canceled"
      render json: { error: "invalid status" }, status: :bad_request
    end
  end

  def customer
    Customer.find(params[:customer_id])
  end
end
