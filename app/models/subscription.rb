class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates_presence_of :title, :price, :status, :frequency
  enum status: [:active, :canceled]
  enum frequency: [:weekly, :monthly, :annually]
end
