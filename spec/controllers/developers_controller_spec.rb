require 'rails_helper'

RSpec.describe DevelopersController, type: :controller do
  describe 'GET #index' do
    context 'when logged in' do
      it 'renders developers#index' do
        user = FactoryBot.create(:user)
        sign_in user
        get :index, as: :json

        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:index)
      end
    end

    context 'when not logged in' do
      it 'returns unauthorized status' do
        get :index, as: :json

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET #show' do
    context 'when logged in' do
      it 'renders developers#show with :not_found if developer not available' do
        developer = create(
          :user,
          email: 'dummy-moron@dummy-morons.com',
          username: 'dummy-moron',
          developer: true,
          hiring_manager: false,
          password: '12345678',
          password_confirmation: '12345678'
        )

        user = FactoryBot.create(:user)
        sign_in user

        get :show, params: { id: developer.id }, as: :json

        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when not logged in' do
      it 'returns unauthorized status' do
        get :show, params: { id: 5 }, as: :json

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
