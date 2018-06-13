# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BadgeIssuancesController, type: :controller do
  describe 'POST #create' do
    it 'returns http success' do
      create(:gunslinger, id: 1)
      post :create, params: { gunslinger_id: 1, template_id: 1 }
      expect(response).to redirect_to gunslinger_path(1)
    end
  end
end
