class TwilioAccount < ActiveRecord::Base
  belongs_to :conference
  before_create :set_account
  before_destroy :close_account 

  private

  def set_account
    conference = Conference.find(self.conference_id)
    account = create_subaccount(conference.name)
    self.sid = account.sid
    self.token = account.auth_token

    phone_number = first_number.phone_number
    link = conference_link(conference)
    account.incoming_phone_numbers.create(phone_number: phone_number, voice_url: link, voice_method: "GET")
    
    self.phone_number = phone_number
  end

  def close_account
    account = TWILIO.accounts.get(self.sid)
    account.update(status: "closed") 
  end

  def create_subaccount(name)
    TWILIO.accounts.create(friendly_name: name)
  end

  def conference_link(conference)
    Rails.application.routes.url_helpers.conference_twilio_accounts_call(conference, host: "morse-demo.herokuapp.com")
  end

  def first_number
    TWILIO.available_phone_numbers.get('US').local.list().first
  end
end
