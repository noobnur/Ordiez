class DeliveryOrder < ApplicationRecord
  validates :order_id,
            presence: true,
            format: { with: /\AGO\d{3}$\z/i, message: "must start with GO and end with integer"}

  validates_presence_of :serving_datetime

  has_many :order_items
  has_one :feedback, as: :ratable

  def delivery_date
    serving_datetime.strftime('%Y/%m/%d')
  end

  def delivery_time
    time = Time.at(serving_datetime).strftime('%I:%M')
    add30 = Time.at(serving_datetime + 30.minutes).strftime('%I:%M%p')
    time + "-" + add30
  end


  # def as_json(options={})
  #   super(except: [:id, :serving_datetime, :created_at, :updated_at],
  #        methods: [:delivery_date, :delivery_time])
  # end

end
