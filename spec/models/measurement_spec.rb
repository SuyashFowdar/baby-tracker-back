require 'rails_helper'

RSpec.describe Measurement, type: :model do
  it 'creates measurement correctly' do
    @user = User.create(name: 'John', password: 'John')
    @measure = Measure.create(item: 'Height', unit: 'cm')
    @measurement = Measurement.new(amount: 2, user: @user, measure: @measure)
    expect(@measurement.valid?).to be true
  end

  it 'checks if measurement can be created without amount' do
    @user = User.create(name: 'John', password: 'John')
    @measure = Measure.create(item: 'Height', unit: 'cm')
    @measurement = Measurement.new(user: @user, measure: @measure)
    expect(@measurement.valid?).to be false
  end

  it 'checks if measurement can be created without user' do
    @user = User.create(name: 'John', password: 'John')
    @measure = Measure.create(item: 'Height', unit: 'cm')
    @measurement = Measurement.new(amount: 2, measure: @measure)
    expect(@measurement.valid?).to be false
  end

  it 'checks if measurement can be created without measure' do
    @user = User.create(name: 'John', password: 'John')
    @measure = Measure.create(item: 'Height', unit: 'cm')
    @measurement = Measurement.new(amount: 2, user: @user)
    expect(@measurement.valid?).to be false
  end
end
