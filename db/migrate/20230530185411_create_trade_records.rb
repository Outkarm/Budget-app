# frozen_string_literal: true

class CreateTradeRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :trade_records do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
