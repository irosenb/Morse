class Conference < ActiveRecord::Base
  has_many :questions
  before_create :create_account 
  before_destroy :delete_account 
  attr_reader :twilio_account

  def create_account
    account = TWILIO.accounts.create(friendly_name: self.name)
    self.sid = account.sid
    self.token = account.auth_token

    phone_number = first_number.phone_number
    account.incoming_phone_numbers.create(phone_number: phone_number)
    self.number = phone_number

    twilio_account = account
  end

  def delete_account
    account = TWILIO.accounts.get(self.sid)
    account.update(status: "closed") 
  end

  private

  def first_number
    TWILIO.available_phone_numbers.get('US').local.list().first
  end
end
