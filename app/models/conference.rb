class Conference < ActiveRecord::Base
  has_many :questions
  has_one  :twilio_account, dependent: :destroy 
  delegate :sid, 
           :token, 
           :phone_number,
           :app_sid, 
           to: :twilio_account, allow_nil: true

  after_create :create_account 

  def create_account
    TwilioAccount.create(conference_id: self.id)
  end
end
