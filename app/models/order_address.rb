class OrderAddress
  include ActiveModel::Model

  attr_accessor :postal_code, :city, :address, :building, :phone_number, :order, :user_id, :item_id,
                :shipping_area_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'must be at least 10 and no more than 11 single-byte digits' }
    validates :user_id
    validates :item_id
  end

  with_options numericality: { other_than: 1 } do
    validates :shipping_area_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code,city: city, address: address, building: building,
                   phone_number: phone_number, shipping_area_id: shipping_area_id, order_id: order.id)
  end
end
