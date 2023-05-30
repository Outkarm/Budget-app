# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :trade_records

  validates :name, presence: true, uniqueness: { scope: :user_id }
end
