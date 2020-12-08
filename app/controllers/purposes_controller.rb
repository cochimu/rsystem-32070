class PurposesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purposes = current_user.purposes
  end

  def new
    @purpose = Purpose.new
  end

  def create
    @purpose = Purpose.create(purpose_params)
    if @purpose.save
      redirect_to purposes_path
    else
      render :new
    end
  end

  def destroy
    @purpose = Purpose.find(params[:id])
    redirect_to purposes_path if @purpose.destroy
  end

  private
  
  def purpose_params
    params.require(:purpose).permit(:content).merge(user_id: current_user.id)
  end
end
