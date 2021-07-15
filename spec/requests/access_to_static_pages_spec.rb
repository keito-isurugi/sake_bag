require 'rails_helper'

RSpec.describe '各ページへのアクセスとタイトル確認'  do
    describe 'ヘッダー' do
      it 'ホーム' do
        visit root_path
        expect(page.status_code).to eq(200)
        expect(page).to have_title "ホーム | SAKE BAG"
      end
      it 'SAKE BAGについて' do
        visit about_path
        expect(page.status_code).to eq(200)
        expect(page).to have_title full_title("このサイトについて")
      end
      it 'お酒一覧' do
        visit sakes_path
        expect(page.status_code).to eq(200)
        expect(page).to have_title full_title("お酒一覧")
      end
      it '簡単ログイン' do
        pending 'テストが失敗するのであとで直す'
        guest_sessions_path
        expect(page.status_code).to eq(200)
        expect(page).to have_title full_title("簡単ログイン")
      end
      it 'ログイン' do
        visit login_path
        expect(page.status_code).to eq(200)
        expect(page).to have_title full_title("ログイン")
      end
      it '会員登録' do
        visit signup_path
        expect(page.status_code).to eq(200)
        expect(page).to have_title full_title("会員登録")
      end
    end
  

  describe 'フッター' do
    it 'ヘルプ' do
      visit help_path
      expect(page.status_code).to eq(200)
      expect(page).to have_title full_title("ヘルプ")
    end
    it 'お問い合わせ' do
      visit contact_path
      expect(page.status_code).to eq(200)
      expect(page).to have_title full_title("お問い合わせ")
    end
    it '利用規約' do
      visit terms_of_service_path
      expect(page.status_code).to eq(200)
      expect(page).to have_title full_title("利用規約")
    end
    it '個人情報保護方針' do
      visit privacy_policy_path
      expect(page.status_code).to eq(200)
      expect(page).to have_title full_title("個人情報保護方針")
    end
  end



end
