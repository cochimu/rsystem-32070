class Staff < ApplicationRecord

  validates :name, presence: true
  
  has_many :reservation_staffs
  has_many :reservations, through: :reservation_staffs
  belongs_to :user
end
