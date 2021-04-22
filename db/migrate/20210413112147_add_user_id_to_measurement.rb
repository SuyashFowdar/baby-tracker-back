# frozen_string_literal: true

class AddUserIdToMeasurement < ActiveRecord::Migration[5.2]
  def change
    add_column :measurements, :user_id, :integer
    add_column :measurements, :measure_id, :integer
  end
end
