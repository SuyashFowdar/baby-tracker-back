# frozen_string_literal: true

class CreateMeasures < ActiveRecord::Migration[5.2]
  def change
    create_table :measures do |t|
      t.string :item
      t.string :unit

      t.timestamps
    end
  end
end
