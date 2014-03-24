class CommentsController < ApplicationController
  include Mandrill::Rails::WebHookProcessor
  include AppointmentsHelper

  before_action :load_appointment
  
  def create
    @comment = @appointment.comments.build(comment_params)

    if @comment.save
      @comment.send_by_sms

      redirect_to listing_appointment_path(@appointment.listing, @appointment)  
    else
      render :new
    end
  end

  private

  def comment_params
    params.
      require(:comment).
      permit(:title, :comment).
      merge(user: current_user)
  end
end
