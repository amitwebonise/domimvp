class CommentsController < ApplicationController
  include Mandrill::Rails::WebHookProcessor
  
  def create
    @appointment = Appointment.find(params[:appointment_id])
    @comment = @appointment.comments.create(comment_params)
    current_user.comments << @comment
    current_user.save
      redirect_to listing_appointment_path(@appointment.listing, @appointment)  
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :comment)
  end
end
