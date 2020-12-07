class StaffsController < ApplicationController
  def index
    @staffs = Staff.all
  end

  def new
    if user_signed_in?
      @staff = Staff.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @staff = Staff.create(staff_params)
    if @staff.save
      redirect_to staffs_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @staff = Staff.find(params[:id])
  end

  def update
  end

  def destroy
    @staff = Staff.find(params[:id])
  end

  private
  
  def staff_params
    params.require(:staff).permit(:name)
  end
end