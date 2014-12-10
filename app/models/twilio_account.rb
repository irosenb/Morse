class TwilioAccount < ActiveRecord::Base
  belongs_to :conference
  before_create :set_account
  before_destroy :close_account 

  def set_account
    conference = Conference.find(self.conference_id)
    account = TWILIO.accounts.create(friendly_name: conference.name)
    self.sid = account.sid
    self.token = account.auth_token

    phone_number = first_number.phone_number
    account.incoming_phone_numbers.create(phone_number: phone_number)
    self.phone_number = phone_number
  end

  def close_account
    account = TWILIO.accounts.get(self.sid)
    account.update(status: "closed") 
  end

  private

  def first_number
    TWILIO.available_phone_numbers.get('US').local.list().first
  end
end