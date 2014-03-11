class AppointmentsController < ApplicationController
  before_filter :get_listing

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def update
  end

  def edit
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    
    if @appointment.save
     redirect_to @listing, notice: 'Property was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private 

  def get_listing
    @listing = Listing.find(params[:listing_id])
  end

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :tenant, :subletter)
  end

end
