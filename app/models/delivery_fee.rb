class DeliveryFee < ApplicationRecord
  include ActiveHash::Associations
  has_many :items
end
