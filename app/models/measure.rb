class Measure < ApplicationRecord
  validates :item, presence: true, uniqueness: true
  validates :unit, presence: true
  has_many :measurements
end
