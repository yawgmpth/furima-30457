class Item < ApplicationRecord
  has_one_attached :image
  
  has_one    :order
  belongs_to :user
 
  with_options presence: true do
  
    validates :name    
    validates :description     
    validates :category_id
    validates :condition_id
    validates :delivery_cost_id
    validates :delivery_area_id
    validates :delivery_day_id
    validates :price, numericality: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, greater_than: 299, less_than: 100000000  }
    validates :user
    
  end 

end
