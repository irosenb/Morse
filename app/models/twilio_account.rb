class TwilioAccount < ActiveRecord::Base
  belongs_to :conference
  before_create :set_account
  before_destroy :close_account 

  private

  def set_account
    conference = Conference.find(self.conference_id)
    account = Subaccount.create(conference.name)
    
    self.sid = account.sid
    self.token = account.auth_token
    self.phone_number = PhoneNumber.new(conference, account).create
    self.app_sid = Twilio::App.new(conference, account).create
  end

  def close_account
    Subaccount.destroy(self.sid)
  end
end
