class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one :order
  has_one_attached :image

  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_day

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :delivery_cost_id, numericality: { other_than: 1 }
    validates :delivery_area_id, numericality: { other_than: 1 }
    validates :delivery_day_id, numericality: { other_than: 1 }
    validates :price, numericality: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, greater_than: 299, less_than: 100_000_000 }
    validates :user
  end
end
