require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品出品がうまくいくとき' do
      it 'nameとdescription,categoryとcondition,delivery_costとdelivery_areaとdelivery_dayが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空だと保存できない' do
        @item.name = ''

        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryが空では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'conditionが空では保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'delivery_costが空では保存できない' do
        @item.delivery_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery cost must be other than 1')
      end
      it 'delivery_areaが空では保存できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery area must be other than 1')
      end
      it 'delivery_dayが空では保存できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day must be other than 1')
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end
      it 'priceが半角数字でないと保存できない' do
        @item.price = '１２３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceの範囲は300~999.999.999であること' do
        @item.price = '299~1000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
