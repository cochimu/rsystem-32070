class ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations.order(created_at: :DESC)
  end

  def new
    if user_signed_in?
      @reservation = Reservation.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @reservation = Reservation.create(reservation_params)
    if @reservation.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:customer_name).merge(user_id: current_user.id)
  end

end