class TradeRecord < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :category

  validates :name, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :category_ids, presence: { message: 'must select at least one category' }
end
