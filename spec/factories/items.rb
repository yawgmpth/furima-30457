FactoryBot.define do
  factory :item do
    name                     { '商品の名前' }
    description              { '商品説明' }
    category_id              { '10' }
    condition_id             { '2' }
    delivery_cost_id         { '2' }
    delivery_area_id         { '47' }
    delivery_day_id          { '2' }
    price                    { '3000' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
