class AppointmentsController < ApplicationController
  before_action :get_listing
  include Mandrill::Rails::WebHookProcessor

  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
    @comment = Comment.new
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  def update
  end

  def edit
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @appointment = @listing.appointments.new  
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @appointment = @listing.appointments.new(appointment_params)
    @appointment.requester = current_user
    
    if @appointment.save
     redirect_to @listing, notice: 'Your appointment request was successfully sent.'
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
    params.require(:appointment).permit(:start_time, :end_time, :requester, :listing_id, :time)
  end

end
