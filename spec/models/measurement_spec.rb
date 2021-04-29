require 'rails_helper'

RSpec.describe Measurement, type: :model do
  context 'Measurements tests' do
    let(:user) { create(:user) }
    let(:measure) { create(:measure) }
    let(:measurement) { build(:measurement) }
    it 'creates measurement correctly' do
      measurement.user = user
      measurement.measure = measure
      expect(measurement.valid?).to be true
    end

    it 'checks if measurement can be created without amount' do
      measurement.user = user
      measurement.measure = measure
      measurement.amount = nil
      expect(measurement.valid?).to be false
    end

    it 'checks if measurement can be created without user' do
      measurement.measure = measure
      expect(measurement.valid?).to be false
    end

    it 'checks if measurement can be created without measure' do
      measurement.user = user
      expect(measurement.valid?).to be false
    end
  end
end
