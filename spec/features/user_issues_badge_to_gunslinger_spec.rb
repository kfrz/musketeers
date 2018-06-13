# frozen_string_literal: true

require 'rails_helper'

feature 'User issues a badge to a Gunslinger', type: :feature do
  let(:body_contents) do
    { data: [id: '1234', name: 'Template'] }
  end

  before do
    stub_request(:get, /sandbox.youracclaim.com/)
      .with(
        headers: {
          'Accept' => 'application/json',
          'Connection' => 'close',
          'Host' => 'sandbox.youracclaim.com',
          'User-Agent' => 'http.rb/3.3.0'
        }
      )
      .to_return(status: 200, body: body_contents.to_json, headers: {})
  end

  context 'when the Gunslinger does not already have a badge' do
    it 'successfully issues a badge' do
      gunslinger = create(:gunslinger)

      visit gunslingers_path

      click_on gunslinger.full_name
      click_on 'Issue ' + Acclaim::BadgeTemplate.list.first.name

      expect(page).to have_content 'Acclaimed? true'
    end
  end
end
