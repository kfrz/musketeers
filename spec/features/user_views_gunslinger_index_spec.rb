# frozen_string_literal: true

require 'rails_helper'

feature 'User views gunslingers index', type: :feature do
  describe 'the user navigates to root path' do
    it 'displays a list of all gunslingers' do
      visit gunslingers_path

      expect(page).to have_content t('gunslingers.index.header')
    end
  end
end
