require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'アイテム新規登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '正常系テスト' do
      it '記入に不備がなければ登録できること' do
        expect(@item).to be_valid
      end
      it 'conditionが空欄でも登録できること' do
        @item.condition = ''
        expect(@item).to be_valid
      end
      it 'memoが空欄でもできること' do
        @item.memo = ''
        expect(@item).to be_valid
      end
      it 'imageが無くても登録できること' do
        @item.image = nil
        expect(@item).to be_valid
      end
    end

    context '異常系テスト' do
      it 'nameが空では登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが数値以外では登録できないこと' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'countが空では登録できないこと' do
        @item.count = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Count can't be blank")
      end
      it 'Countが数値以外では登録できないこと' do
        @item.count = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Count is not a number")
      end
      it 'note_idが空では登録できないこと' do
        @item.note = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Note must exist")
      end
      it 'user_idが空では登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end