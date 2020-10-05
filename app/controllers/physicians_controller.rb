class PhysiciansController < ApplicationController
  before_action :set_physician, only: [:show, :edit, :update, :destroy]
  def index
    @physicians = Physician.all
  end

  def show;end
  
  def new
    @physician = Physician.new
  end

  def edit;end

  def create
    @physician = Physician.new(physician_params)
    if @physician.save
      redirect_to new_session_path, notice: 'Physician was Successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @physician.update(physician_params)
      redirect_to @physician, notice: 'Physician was Successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @physician.destroy
    redirect_to physicians_url, notice: 'Physician was Successfully destroyed.'
  end

  def appointment
    @physician = Physician.find(params[:id])
    @appointments = @physician.appointments
  end

  private
  def set_physician
    @physician = Physician.find(params[:id])
  end

  def physician_params
    params.require(:physician).permit(:name, :email, :password, :department)
  end
end
