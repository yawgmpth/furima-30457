class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  has_one    :order
  has_one_attached :image
  
  belongs_to :user
  # belongs_to_active_hash :category,:condition,:delivery_cost,:delivery_area,:delivery_day
  
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

