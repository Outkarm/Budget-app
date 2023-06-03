class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :trade_records
  mount_uploader :icon, ImageUploader

  validates :name, presence: true, uniqueness: { scope: :user_id }

  def total_trade_records_amount
    trade_records.sum(&:amount)
  end
end
