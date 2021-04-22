# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :users
    create_table :users do |t|
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end