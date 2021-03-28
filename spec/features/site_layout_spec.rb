require 'rails_helper'

RSpec.describe "SiteLayoutTest" do
  before { visit root_path}
  subject { page } 
  scenario "layout links" do
    is_expected.to have_link nil, href: root_path, count: 13
    is_expected.to have_link nil, href: help_path
    is_expected.to have_link nil, href: about_path
    is_expected.to have_link nil, href: contact_path
    is_expected.to have_link nil, href: privacy_policy_path
    is_expected.to have_link nil, href: terms_of_service_path
    visit contact_path
    expect(page).to have_title full_title("お問い合わせ")
    visit signup_path
    expect(page).to have_title full_title("会員登録")  
  end
end
