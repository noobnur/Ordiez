class DeliveryOrder < ApplicationRecord
  validates :order_id,
            presence: true,
            format: { with: /\A[GO]+[\d]\Z/, message: "must start with GO and end with integer"}

  validates_presence_of :serving_datetime

  has_many :order_items
end
