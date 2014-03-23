class Comment < ActiveRecord::Base
  validates :comment, :user, presence: true

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  default_scope -> { order('created_at ASC') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user
  has_paper_trail

  def send_by_sms
    dispatcher = SmsDispatcher.new
    dispatcher.dispatch(recipient_phone_number, comment)
  end

  private

  def recipient_phone_number
    # The user who's currently commenting
    commentor = user

    # The user who is listing
    lister = commentable.listing.user

    # The user who is requesting
    requester = appointment.requester

    unless user == lister
      phone_number = lister.phone_number
    end

    unless user == requester
      phone_number = requester.phone_number
    end

    phone_number
  end
end
