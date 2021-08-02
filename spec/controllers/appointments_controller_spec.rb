require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  describe 'GET #index' do
    context 'when logged in' do
      it 'renders :appointment_created view' do
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
end
