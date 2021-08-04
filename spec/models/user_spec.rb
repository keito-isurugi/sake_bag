require 'rails_helper'

RSpec.describe User do
  it 'テストユーザーは存在している' do
    expect(build(:user)).to be_valid 
  end

  describe "ユーザー名とメールアドレスのバリデーションテスト" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:name).is_at_most(20) }
    it { is_expected.to validate_length_of(:email).is_at_most(255) }
    it do
      is_expected.to allow_values('first.last@foo.jp',
                                  'user@example.com',
                                  'USER@foo.COM',
                                  'A_US-ER@foo.bar.org',
                                  'alice+bob@baz.cn').for(:email)
    end
    it do
      is_expected.to_not allow_values('user@example,com',
                                      'user_at_foo.org',
                                      'user.name@example.',
                                      'foo@bar_baz.com',
                                      'foo@bar+baz.com').for(:email)
    end
    describe "メールアドレスのバリデーションテスト" do
      let!(:user) { create(:user, email: 'original@example.com') }
      it '一意でないメールアドレスは無効' do
        user = build(:user, email: 'original@example.com')
        expect(user).to_not be_valid
      end
      it 'メールアドレスは大文字小文字を区別しない' do
        user = build(:user, email: 'ORIGINAL@EXAMPLE.COM')
        expect(user).to be_valid
      end
      context "メールアドレス大文字登録" do
        let!(:user) { create(:user, email: 'ORIGINAL@EXAMPLE.COM') }
        it '大文字で登録したメールアドレスは小文字に変換される' do
          expect(user.email).to eq  'original@example.com'
        end
      end
    end


    describe "パスワードのバリデーションテスト" do
      it 'パスワードが空白の場合は無効' do
        user = build(:user, password: '' * 6)
        expect(user).to_not be_valid  
      end
    end
    it { is_expected.to validate_length_of(:password).is_at_least(6) }

  end



  
  
end
