require 'rails_helper'

RSpec.describe 'StaticPages'  do
  #タイトルのテスト「SAKE BAG」は重複多数で改善の余地あり。

  describe 'Home page' do
    it 'should get root' do
      visit root_path
      expect(page.status_code).to eq(200)
      expect(page).to have_title full_title
      # expect(page).not_to have_title "ホーム |"
    end
  end

  describe 'Help page' do
    it 'should get help' do
      visit help_path
      expect(page.status_code).to eq(200)
      expect(page).to have_title full_title("ヘルプ")
    end
  end

  describe 'About page' do
    it 'should get root' do
      visit about_path
      expect(page.status_code).to eq(200)
      expect(page).to have_title full_title("このサイトについて")
    end
  end

  describe 'Contact page' do
    it 'should get root' do
      visit contact_path
      expect(page.status_code).to eq(200)
      expect(page).to have_title full_title("お問い合わせ")
    end
  end

  describe 'Privacy_policy page' do
    it 'should get root' do
      visit privacy_policy_path
      expect(page.status_code).to eq(200)
      expect(page).to have_title full_title("個人情報保護方針")
    end
  end

  describe 'Terms_of_service page' do
    it 'should get root' do
      visit terms_of_service_path
      expect(page.status_code).to eq(200)
      expect(page).to have_title full_title("利用規約")
    end
  end
end