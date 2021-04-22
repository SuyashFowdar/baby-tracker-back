class Measurement < ApplicationRecord
  validates :amount, presence: true
  validates :user_id, presence: true
  validates :measure_id, presence: true
  belongs_to :measure
  belongs_to :user
end
