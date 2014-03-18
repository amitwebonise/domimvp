class User < ActiveRecord::Base
 before_create :create_profile
 after_create :add_user_to_mailchimp
  before_destroy :remove_user_from_mailchimp


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable

  has_paper_trail

  has_many :appointments, foreign_key: 'requester_id'

  #->Prelang (user_login/devise)
  has_many :listings
  has_many :properties
  has_one :profile
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first

    # The User was found in our database
    return user if user

    # The User was not found and we need to create them
    User.create(name:     auth.extra.raw_info.name,
                provider: auth.provider,
                uid:      auth.uid,
                email:    auth.info.email,
                password: Devise.friendly_token[0,20])
  end

#user roles
  

  def create_profile
    unless self.profile
      self.profile = Profile.new
    end
  end

  def add_user_to_mailchimp
    return if email.include?(ENV['madeleke13@gmail.com'])
    mailchimp = Gibbon::API.new
    result = mailchimp.lists.subscribe({
      :id => ENV['MAILCHIMP_LIST_ID'],
      :email => {:email => self.email},
      :double_optin => false,
      :update_existing => true,
      :send_welcome => true
    })

    Rails.logger.info("Subscribed #{self.email} to MailChimp") if result
  end

  def remove_user_from_mailchimp
    mailchimp = Gibbon::API.new
    result = mailchimp.lists.unsubscribe({
      :id => ENV['MAILCHIMP_LIST_ID'],
      :email => {:email => self.email},
      :delete_member => true,
      :send_goodbye => false,
      :send_notify => true
    })

    Rails.logger.info("Unsubscribed #{self.email} from MailChimp") if result
  end

end
