require 'rails_helper'

RSpec.describe Staff, type: :model do
  before do
    @staff = FactoryBot.build(:staff)
  end

  describe 'スタッフ名の保存' do
    context "スタッフ名の保存ができる時" do
      it "スタッフ名があれば登録できる" do
        expect(@staff).to be_valid
      end
    end

    context "スタッフ名の保存ができない時" do
      it "スタッフ名が空だと登録できない" do
        @staff.name = ''
        @staff.valid?
        expect(@staff.errors.full_messages).to include("スタッフ名を入力してください")
      end
    end
  end
end
