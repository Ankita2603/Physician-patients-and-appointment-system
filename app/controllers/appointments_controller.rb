class AppointmentsController < ApplicationController
  before_action :set_patient

  def index
    @appointments = @patient.appointments
  end

  def show
    @appointment = @patient.appointments.find(params[:id])
  end

  def new
    @appointment = @patient.appointments.new
  end

  def edit
    @appointment = @patient.appointments.find(params[:id])
  end

  def create
    @appointment = @patient.appointments.new(appointment_params)
    if @appointment.save
      redirect_to patient_appointments_path, notice: 'Appointment was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @appointment = @patient.appointments.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to patient_appointments_path, notice: 'Appointment was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @appointment = @patient.appointments.find(params[:id])
    @appointment.destroy
    redirect_to patient_appointments_path, notice: 'Appointment was successfully destroyed.'
  end

  private
  def set_patient
    @patient = Patient.find(params[:patient_id])
  end 

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :patient_id, :physician_id)
  end

end
