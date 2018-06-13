# frozen_string_literal: true

require 'rails_helper'

describe BadgeIssuanceService do
  it 'updates a gunslinger' do
    create(:gunslinger, id: 1)
    params = { id: 1 }

    allow(Acclaim::Badge).to receive(:issue).with(params).and_return(true)

    expect(Acclaim::Badge).to receive(:issue)

    BadgeIssuanceService.new(params).call
  end
end
