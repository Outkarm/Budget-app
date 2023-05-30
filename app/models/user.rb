# frozen_string_literal: true

class User < ApplicationRecord
  has_many :trade_records, foreign_key: 'AuthorId'
  has_many :categories

  validates :name, presence: true, uniqueness: true
end
