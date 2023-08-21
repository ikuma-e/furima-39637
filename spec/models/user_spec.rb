require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる' do
      it '全ての入力項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
      it 'emailには@を含めないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end
      it 'emailは一意でないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'o2o2o'
        @user.password_confirmation = 'o2o2o'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは英語(数字)のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英数字を両方含む必要があります")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a1a1a1'
        @user.password_confirmation = 'a1a1aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '名字が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.family_name = 'sasaki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it '名前が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'jiro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it '名字のフリガナが全角（カタカナ）でないと登録できない' do
        @user.family_name_kana = 'ささき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      it '名前のフリガナが全角（カタカナ）でないと登録できない' do
        @user.first_name_kana = 'じろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it '生年月日が空欄だと保存できない' do
        @user.user_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User birth can't be blank")
      end
    end
  end

end
