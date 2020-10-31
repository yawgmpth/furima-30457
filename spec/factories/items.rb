FactoryBot.define do
  FactoryBot.define do

    factory :item do
      item_images              {[build(:item_image)]}
      name                     {"柑橘"}
      description              {"商品説明"}
      category_id              {"365"}
      condition_id             {"1"}
      delivery_cost_id         {"1"}
      delivery_area_id         {"24"}
      delivery_day_id          {"2"}
      price                    {"3000"}
    end
  end 
end