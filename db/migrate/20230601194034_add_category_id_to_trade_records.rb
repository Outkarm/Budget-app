# frozen_string_literal: true

class AddCategoryIdToTradeRecords < ActiveRecord::Migration[7.0]
  def change
    add_reference :trade_records, :category, null: false, foreign_key: true
  end
end
