class OrderForm
  include ActiveModel::Model
 
  attr_accessor :user_id, :item_id,:post_code ,:prefectures_id,:city ,:address ,:building,:telephone ,:order_id
  
    with_options presence: true do
    
    validates :post_code { with: /\A\d{3}[-]\d{4}\z/ }
  
    validates :prefectures_id
    validates :city
    validates :address
    validates :building
    validates :telephone { with: /\A\d{11}\z/ } 
    
  
    def save
        order = Oder.create(user_id: user_id, item_id: item_id)
      
        Addresses.create( 
        post_code: post_code, 
        prefectures_id: prefectures_id,
        city: city,
        address: address,
        building: building,
        telephone: telephone,
        order_id: order.id
       )
      end
    end