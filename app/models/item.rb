class Item < ApplicationRecord
  validates :name, presence: true
  validates :text, presence: true
  validates :image, presence: true

  validates :price, presence: true, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_day_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day
end
