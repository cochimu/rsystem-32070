class StaffsController < ApplicationController
  before_action :authenticate_user!

  def index
    @staffs = current_user.staffs
  end

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.create(staff_params)
    if @staff.save
      redirect_to staffs_path
    else
      render :new
    end
  end

  def destroy
    @staff = Staff.find(params[:id])
    redirect_to staffs_path if @staff.destroy
  end

  private
  
  def staff_params
    params.require(:staff).permit(:name).merge(user_id: current_user.id)
  end

end