require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '内容に問題がない場合' do
      it '条件通り全ての項目に値が存在すれば登録できる' do
        expect(@purchase_address).to be_valid
      end
      it 'bilding_nameは空でも登録できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'ship_from_idが空では登録できない' do
        @purchase_address.ship_from_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Ship from can't be blank")
      end
      it 'city_nameが空だと保存できない' do
        @purchase_address.city_name = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City name can't be blank")
      end
      it 'streetが空だと保存できない' do
        @purchase_address.street = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上11桁以内でないと保存できない' do
        @purchase_address.phone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberが半角数値以外では保存できない' do
        @purchase_address.phone_number = 'abcdefghijk'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid. Input only numbers')
      end
      it 'user_idが紐づいていないと保存できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていないと保存できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
