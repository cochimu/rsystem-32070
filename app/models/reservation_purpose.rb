class ReservationPurpose < ApplicationRecord
  belongs_to :purpose
  belongs_to :reservation
end
