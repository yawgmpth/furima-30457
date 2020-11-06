class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :post_code, :delivery_area_id, :city, :address, :building, :telephone, :order_id, :token

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :delivery_area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :telephone, format: { with: /\A\d{11}\z/ }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(
      post_code: post_code,
      delivery_area_id: delivery_area_id,
      city: city,
      address: address,
      building: building,
      telephone: telephone,
      order_id: order.id
    )
  end
end
