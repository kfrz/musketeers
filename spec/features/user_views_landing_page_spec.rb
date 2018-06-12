# frozen_string_literal: true

require 'rails_helper'

feature 'User views landing page', type: :feature do
  describe 'the user navigates to root path' do
    it 'displays the basic landing (marketing) page' do
      visit root_path

      expect(page).to have_content t('pages.home.header')
    end
  end
end
