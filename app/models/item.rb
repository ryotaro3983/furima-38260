class Item < ApplicationRecord
  validates :name       ,presence: true
  validates :text       ,presence: true
  validates :price      ,presence: true, format: { with: /\A[0-9]+\z/}, numericality: { in: 300..9,999,999}
  
  with_options numericality: { other_than: 1 , message: "can't be blank"} do
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
