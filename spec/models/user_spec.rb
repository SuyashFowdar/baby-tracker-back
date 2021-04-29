require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User tests' do
    let(:user) { build(:user) }
    let(:user2) { build(:user) }
    it 'creates user correctly' do
      expect(user.valid?).to be true
    end

    it 'checks if user can be created without name' do
      user.name = nil
      expect(user.valid?).to be false
    end

    it 'checks if user can be created without password' do
      user.password = nil
      expect(user.valid?).to be false
    end

    it 'checks if user with same name can be created' do
      user.save
      expect(user2.save).to be false
    end
  end
end
