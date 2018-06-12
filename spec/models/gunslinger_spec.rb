# frozen_string_literal: true

require 'rails_helper'

describe Gunslinger do
  let(:gunslinger) { build_stubbed(:gunslinger) }

  # Validations
  describe 'validations' do
    it { is_expected.to(validate_presence_of(:first_name)) }
    it { is_expected.to(validate_presence_of(:last_name)) }
    it { is_expected.to(validate_presence_of(:email)) }
    it { is_expected.to(validate_uniqueness_of(:email)) }
  end

  # Class methods
  describe '.acclaimed' do
    it 'returns all Gunslingers that have badges' do
      create(:gunslinger)
      acclaimed_slinger = create(:gunslinger, acclaimed: true)

      results = Gunslinger.acclaimed

      expect(results).to contain_exactly(acclaimed_slinger)
    end
  end

  # Instance methods
  describe '#full_name' do
    it 'returns the Gunslinger\'s full name' do
      full_name = gunslinger.first_name + ' ' + gunslinger.last_name
      expect(gunslinger.full_name).to eq full_name
    end
  end
end
