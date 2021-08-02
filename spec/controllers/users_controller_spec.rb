require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    it 'creates an user with valid params' do
      post :create, params: {
        email: Faker::Internet.unique.email,
        username: Faker::Internet.unique.username(specifier: 5..20),
        password: '12345678',
        password_confirmation: '12345678',
        admin: false,
        hiring_manager: true,
        developer: false
      }, as: :json

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:created)
    end

    it 'rejects creating a user with invalid params' do
      post :create, params: {
        email: Faker::Internet.unique.email,
        username: Faker::Internet.unique.username(specifier: 5..20),
        password: '12345678',
        password_confirmation: '123456',
        admin: false,
        hiring_manager: true,
        developer: false
      }, as: :json

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET users#validate_session' do
    it 'returns authorized when logged in' do
      user = FactoryBot.create(:user)
      sign_in user
      get :validate_session, as: :json

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:session_validated)
    end

    it 'returns unauthorized when not logged in' do
      FactoryBot.create(:user)
      get :validate_session, as: :json

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
