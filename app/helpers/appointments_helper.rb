module AppointmentsHelper
  def load_appointment
    @appointment ||= Appointment.find(params[:appointment_id])
  end
end
