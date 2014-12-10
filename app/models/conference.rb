class Conference < ActiveRecord::Base
  has_many :questions
  has_one  :twilio_account
  delegate :sid, :token, :phone_number, to: :twilio_account

  after_create :create_account 

  def create_account
    TwilioAccount.create(conference_id: self.id)
  end
end
