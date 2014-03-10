class AppointmentsController < ApplicationController
  def index
  end

  def show
  end

  def update
  end

  def edit
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to dashboard, notice: 'Your appointment request is a success!' }
      else
        format.html { render action: 'new' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private 

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :tenant, :subletter)
  end

end
