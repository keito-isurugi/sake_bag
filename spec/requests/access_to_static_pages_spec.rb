require 'rails_helper'

RSpec.describe 'StaticPages'  do
    describe 'ホーム' do
      it '画面の表示' do
        visit root_path
        expect(page.status_code).to eq(200)
        expect(page).to have_title "ホーム | SAKE BAG"
      end
    end
  

  describe 'ヘルプ' do
    it '画面の表示' do
      visit help_path
      expect(page.status_code).to eq(200)
      expect(page).to have_title full_title("ヘルプ")
    end
  end

  describe 'SAKE BAGについて' do
    it '画面の表示' do
      visit about_path
      expect(page.status_code).to eq(200)
      expect(page).to have_title full_title("このサイトについて")
    end
  end

  describe 'お問い合わせ' do
    it '画面の表示' do
      visit contact_path
      expect(page.status_code).to eq(200)
      expect(page).to have_title full_title("お問い合わせ")
    end
  end

  describe '個人情報保護方針' do
    it '画面の表示' do
      visit privacy_policy_path
      expect(page.status_code).to eq(200)
      expect(page).to have_title full_title("個人情報保護方針")
    end
  end

  describe '利用規約' do
    it '画面の表示' do
      visit terms_of_service_path
      expect(page.status_code).to eq(200)
      expect(page).to have_title full_title("利用規約")
    end
  end
end