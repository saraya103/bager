require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'ノート新規登録' do
    before do
      @note = FactoryBot.build(:note)
    end

    context '正常系テスト' do
      it '記入に不備がなければ登録できること' do
        expect(@note).to be_valid
      end
    end

    context '異常系テスト' do
      it 'idが空では登録できないこと' do
        @note.id = nil
        @note.valid?
        expect(@note.errors.full_messages).to include("Id can't be blank")
      end
      it 'idが登録済のものでは登録できないこと' do
        @note.save
        another_note = FactoryBot.build(:note, id: @note.id)
        another_note.valid?
        expect(another_note.errors.full_messages).to include('Id has already been taken')
      end
      it 'passwordが空では登録できないこと' do
        @note.password = nil
        @note.valid?
        expect(@note.errors.full_messages).to include("Password can't be blank")
      end
      it 'ownerが空では登録できないこと' do
        @note.owner = nil
        @note.valid?
        expect(@note.errors.full_messages).to include("Owner can't be blank")
      end
      it 'list_nameが空では登録できないこと' do
        @note.list_name = ''
        @note.valid?
        expect(@note.errors.full_messages).to include("List name can't be blank")
      end
      it 'last_nameが空では登録できないこと' do
        @note.log_name = ''
        @note.valid?
        expect(@note.errors.full_messages).to include("Log name can't be blank")
      end
      it 'reserve_nameが空では登録できないこと' do
        @note.reserve_name = ''
        @note.valid?
        expect(@note.errors.full_messages).to include("Reserve name can't be blank")
      end
      it 'item_nameが空では登録できないこと' do
        @note.item_name = ''
        @note.valid?
        expect(@note.errors.full_messages).to include("Item name can't be blank")
      end
    end
  end
end