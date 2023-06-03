# frozen_string_literal: true

class CreateCategoriesTradeRecordsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_trade_records, id: false do |t|
      t.belongs_to :category
      t.belongs_to :trade_record
    end

    add_index :categories_trade_records, %i[category_id trade_record_id], unique: true,
                                                                          name: 'index_categories_trade_records_on_ids'
  end
end
