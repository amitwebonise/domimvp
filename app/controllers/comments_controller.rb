class CommentsController < ApplicationController
  include Mandrill::Rails::WebHookProcessor

  before_action :load_appointment
  
  def create
    @comment = @appointment.comments.build(comment_params)

    if @comment.save
      @comment.dispatch_by_sms

      redirect_to listing_appointment_path(@appointment.listing, @appointment)  
    else
      render :new
    end
  end

  private

  def load_appointment
    @appointment ||= Appointment.find(params[:appointment_id])
  end

  def comment_params
    params.
      require(:comment).
      permit(:title, :comment).
      merge(user: current_user)
  end
end
