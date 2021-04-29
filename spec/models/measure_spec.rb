require 'rails_helper'

RSpec.describe Measure, type: :model do
  context 'Measure tests' do
    let(:measure) { build(:measure) }
    let(:measure2) { build(:measure) }
    it 'creates measure correctly' do
      expect(measure.valid?).to be true
    end

    it 'checks if measure can be created without item' do
      measure.item = nil
      expect(measure.valid?).to be false
    end

    it 'checks if measure can be created without unit' do
      measure.unit = nil
      expect(measure.valid?).to be false
    end

    it 'checks if measure with same item can be created' do
      measure.save
      expect(measure2.save).to be false
    end
  end
end
