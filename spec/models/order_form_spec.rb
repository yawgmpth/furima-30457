require 'rails_helper'
describe OrderForm do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品の購入' do
    context '商品購入がうまくいくとき' do
      it '入力項目が全て正しく入力された時購入に成功する' do
        expect(@order_form).to be_valid
      end
      it '建物名が空でも購入できること' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '商品の購入がうまくいかないとき' do
      it 'tokenが空だと購入出来ない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では購入出来ない' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号にハイフンなしでは購入出来ない' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Post code is invalid')
      end

      it '都道府県のidが空の時購入出来ない' do
        @order_form.delivery_area_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Delivery area can't be blank")
      end
      it '都道府県のidが１の時購入出来ない' do
        @order_form.delivery_area_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Delivery area must be other than 1')
      end
      it '市区町村が空では購入出来ない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では購入できない' do
        @order_form.telephone = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号が12桁以上では購入できない' do
        @order_form.telephone = 123_456_789_012
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Telephone is invalid')
      end
      it '電話番号がハイフンなしでは購入できない' do
        @order_form.telephone = 299
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Telephone is invalid')
      end
    end
  end
end
