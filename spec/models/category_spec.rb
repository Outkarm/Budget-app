# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }
  let(:category) { Category.new(name: 'Food', user:) }

  describe 'validations' do
    it 'is valid with a name and user' do
      expect(category).to be_valid
    end

    it 'is invalid without a name' do
      category.name = nil
      expect(category).to be_invalid
      expect(category.errors[:name]).to include("can't be blank")
    end
  end

  describe '#total_trade_records_amount' do
    let(:trade_record1) { TradeRecord.create(amount: 100, category:) }
    let(:trade_record2) { TradeRecord.create(amount: 200, category:) }

    it 'returns 0 when there are no trade records' do
      expect(category.total_trade_records_amount).to eq(0)
    end
  end
end
