class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :title,       presence: true
  validates :explanation, presence: true
  validates :price,       presence: true
  validates :category_id,        numericality: { other_than: 1 }
  validates :condition_id,       numericality: { other_than: 1 }
  validates :prefecture_id,      numericality: { other_than: 1 }
  validates :shipping_burden_id, numericality: { other_than: 1 }
  validates :delivery_day_id,    numericality: { other_than: 1 }
end
