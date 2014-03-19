class CommentsController < ApplicationController
  include Mandrill::Rails::WebHookProcessor
  
  def create
    @appointment = Appointment.find(params[:appointment_id])
    @comment = @appointment.comments.create(comment_params)
    redirect_to listing_appointment_path(@appointment.listing, @appointment)  
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :comment)
  end
end
