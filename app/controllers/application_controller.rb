class ApplicationController < ActionController::Base
    helper_method :current_patient
    helper_method :current_physician
    def current_patient
        if session[:patient_id]
            @current_patient ||= Patient.find(session[:patient_id])
        else
            @current_patient = nil
        end
    end
    def current_physician
        if session[:physician_id]
            @current_physician ||= Physician.find(session[:physician_id])
        else
            @current_physician = nil
        end
    end
end
