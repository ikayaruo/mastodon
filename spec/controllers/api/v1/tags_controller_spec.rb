require 'rails_helper'

RSpec.describe Api::V1::TagsController, type: :controller do
  render_views

  describe 'GET #trend' do
    it 'returns http success' do
      get :trend
      expect(response).to have_http_status(:success)
    end
  end
end
