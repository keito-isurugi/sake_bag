FactoryBot.define do
    factory :user do
        name { 'Example User' }
        sequence(:email) { |n| "user_#{n}@example.com" }
        password { 'password' }
        password_confirmation { 'password' }
    end
    factory :takashi, class: User do
        name "Takashi"
        email "takashi@example.com"
        password { 'password' }
        password_confirmation { 'password' }
      end
    
      factory :satoshi, class: User do
        name "Satoshi"
        email "satoshi@example.com"
        password { 'password' }
        password_confirmation { 'password' }
      end
end