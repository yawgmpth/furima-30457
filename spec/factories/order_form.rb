FactoryBot.define do
  factory :order_form do
    token                    { 'tok_abcdefghijk00000000000000000' }
    post_code                { '111-1111' }
    delivery_area_id         { 2 }
    city                     { '大阪市' }
    address                  { '123' }
    telephone                { '12345678901' }
  end
end
