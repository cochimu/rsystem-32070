class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @reservation = Reservation.new
    @staffs = current_user.staffs
    @purposes = current_user.purposes
    @items = current_user.items
  end

  def create
    @reservation = Reservation.create(reservation_params)
    if @reservation.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to root_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:customer_name, :memo, :day).merge(user_id: current_user.id)
  end

end