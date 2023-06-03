# frozen_string_literal: true

# spec/models/trade_record_spec.rb
require 'rails_helper'

RSpec.describe TradeRecord, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:amount).is_greater_than(0) }
    it { should validate_presence_of(:category_ids).with_message('must select at least one category') }
  end

  describe 'associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { should have_and_belong_to_many(:categories) }
  end
end
