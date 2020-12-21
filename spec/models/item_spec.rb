require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '提案項目の保存' do
    context "提案項目の保存ができる時" do
      it "項目名があれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context "提案項目の保存ができない時" do
      it "提案項目が空だと登録できない" do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("提案項目を入力してください")
      end
    end
  end
end
