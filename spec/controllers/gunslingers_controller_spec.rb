# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GunslingersController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response.successful?).to be true
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      gunslinger = create(:gunslinger)
      get :show, params: { id: gunslinger.to_param }
      expect(response.successful?).to be true
    end
  end
end
