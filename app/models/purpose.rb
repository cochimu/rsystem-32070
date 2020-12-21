class Purpose < ApplicationRecord

  validates :content, presence: true
  
  has_many :reservation_purposes
  has_many :reservations, through: :reservation_purposes
  belongs_to :user
end
