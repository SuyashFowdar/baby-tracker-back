# frozen_string_literal: true

class UpdateMeasurementAmount < ActiveRecord::Migration[5.2]
  def change
    change_column :measurements, :amount, :decimal
  end
end
