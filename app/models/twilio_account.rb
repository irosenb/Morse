class TwilioAccount < ActiveRecord::Base
  attr_accessor :name
  before_create :set_account

  def set_account
    account = TWILIO.accounts.create(friendly_name: self.name)
    self.sid = account.sid
    self.token = account.auth_token

    phone_number = first_number.phone_number
    account.incoming_phone_numbers.create(phone_number: phone_number)
    self.number = phone_number
  end
end
