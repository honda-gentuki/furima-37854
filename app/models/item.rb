class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_area
  belongs_to :shipping_cost
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :name,         length: { maximum: 40 }
    validates :description , length: { maximum: 1000 }
  end

  with_options numericality: { other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :shipping_area_id
    validates :shipping_cost_id
    validates :shipping_day_id
  end

    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
