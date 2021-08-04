require 'rails_helper'

RSpec.describe "ユーザーコントローラーアクセステスト" do
  describe 'new' do
    it 'アクセス成功' do
      get signup_path
      expect(response).to have_http_status 200  
    end
  end
  describe UsersController, type: :request do
    describe 'GET #index' do
      before do
        FactoryBot.create :takashi
        FactoryBot.create :satoshi
      end
  
      it 'リクエストが成功すること' do
        get users_url
        expect(response.status).to eq 302
      end
  
      it 'ユーザーが登録されること' do
        expect do
          post :create, params: { user: FactoryBot.attributes_for(:user) }
        end.to change(User, :count).by(1)
      end
    end
  end
end
