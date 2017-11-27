require 'faker'

FactoryBot.define do
  factory :delivery_order do
    sequence(:order_id) { |i| "GO"+(i+1).to_s.rjust(3,'0') }
    sequence(:serving_datetime) { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  end
end
