class SessionsController < ApplicationController
  def new;end

  def create
    patient = Patient.find_by_email(params[:email])
    physician = Physician.find_by_email(params[:email])
    if patient && patient.authenticate(params[:password]) || physician && physician.authenticate(params[:password])
      if patient
        session[:patient_id] = patient.id
        redirect_to patients_path(@patient), notice: "Logged in!"
      else
        session[:physician_id] = physician.id
        redirect_to physicians_path(@physician), notice: "Logged in"
      end
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:patient_id] = nil
    redirect_to new_session_path, notice: "Logged out!"
  end
end
