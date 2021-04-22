# frozen_string_literal: true

class CreateMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :measurements do |t|
      t.integer :amount

      t.timestamps
    end
  end
end
