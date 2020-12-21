class Item < ApplicationRecord

  validates :content, presence: true

  has_many :reservation_items
  has_many :reservations, through: :reservation_items
  belongs_to :user
end
