class CoversController < ApplicationController
  def index
    if user_signed_in?
      @reservations = current_user.reservations
    else
      @reservations = Reservation.all
    end
  end
end
