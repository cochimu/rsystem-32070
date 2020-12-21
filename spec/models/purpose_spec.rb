require 'rails_helper'

RSpec.describe Purpose, type: :model do
  before do
    @purpose = FactoryBot.build(:purpose)
  end

  describe '手続き内容の保存' do
    context "手続き内容の保存ができる時" do
      it "項目名があれば登録できる" do
        expect(@purpose).to be_valid
      end
    end

    context "手続き内容の保存ができない時" do
      it "手続き内容が空だと登録できない" do
        @purpose.content = ''
        @purpose.valid?
        expect(@purpose.errors.full_messages).to include("手続き内容を入力してください")
      end
    end
  end
end