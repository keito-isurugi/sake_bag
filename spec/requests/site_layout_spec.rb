require 'rails_helper'

RSpec.describe "リンクテスト" do
  before { visit root_path }
  subject { page } 

  describe 'ホームページに必要なリンクが存在しているか' do
    context "ヘッダー" do
      it 'ホーム✕２' do
        is_expected.to have_link nil, href: root_path, count: 2
      end
      it 'SAKE BAGとは' do
        is_expected.to have_link 'SAKE BAGとは', href: about_path
      end
      it 'お酒一覧' do
        is_expected.to have_link 'お酒一覧', href: sakes_path
      end
      it '簡単ログイン' do
        is_expected.to have_link '簡単ログイン', href: guest_sessions_path
      end
      it 'ログイン' do
        is_expected.to have_link 'ログイン', href: login_path
      end
      it '会員登録' do
        is_expected.to have_link '会員登録', href: signup_path
      end
    end

    context "メイン" do
      it 'ログイン' do
        is_expected.to have_link 'ログインしてお酒を記録する！', href: login_path
      end
      it 'レビュー一覧' do
        is_expected.to have_link 'もっと見る', href: post_reviews_path
      end
    end
    
    context "フッター" do
      it 'ヘルプ' do
        is_expected.to have_link 'ヘルプ', href: help_path
      end
      it 'お問い合わせ' do
        is_expected.to have_link 'お問い合わせ', href: contact_path
      end
      it '利用規約' do
        is_expected.to have_link '利用規約', href: terms_of_service_path
      end
      it '個人情報保護方針' do
        is_expected.to have_link '個人情報保護方針', href: privacy_policy_path
      end
    end
  end
end
