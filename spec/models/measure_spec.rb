require 'rails_helper'

RSpec.describe Measure, type: :model do
  it 'creates measure correctly' do
    @measure = Measure.new(item: 'Weight', unit: 'Kg')
    expect(@measure.valid?).to be true
  end

  it 'checks if measure can be created without item' do
    @measure = Measure.new(unit: 'Kg')
    expect(@measure.valid?).to be false
  end

  it 'checks if measure can be created without unit' do
    @measure = Measure.new(item: 'Weight')
    expect(@measure.valid?).to be false
  end

  it 'checks if measure with same item can be created' do
    Measure.create(item: 'Weight', unit: 'Kg')
    @measure = Measure.new(item: 'Weight', unit: 'Kg')
    expect(@measure.valid?).to be false
  end
end
