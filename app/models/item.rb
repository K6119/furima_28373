class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name
    validates :image
    validates :item_description
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :item_condition_id
    validates :category_id
    validates :delivery_fee_id
    validates :shipping_area_id
    validates :shipping_days_id
  end

  validates :name, length: { maximum: 40 }
  validates :item_description, length: { maximum: 1000 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  # rspec/messageオプション
  has_one :purchase
  belongs_to :user
  has_one_attached :images
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_days
end
