require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録がうまくいく時' do
      it "全ての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "パスワードが6文字以上であれば登録できる" do
        @user.password = "sample1"
        @user.password_confirmation = "sample1"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかなき時' do
      it "名前（店舗名)が空だと登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（店舗名）を入力してください")
      end

      it "メールアドレスが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end

      it "重複したメールアドレスが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include ("メールアドレスはすでに存在します")
      end

      it "パスワードが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it "パスワードが5文字以下だと登録できない" do
        @user.password = '0000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it "パスワードと確認用パスワードが同じでないと登録できない" do
        @user.password = 'sample1'
        @user.password_confirmation = 'sanple2'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
