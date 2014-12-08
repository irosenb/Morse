class Conference < ActiveRecord::Base
  has_many :questions
  before_create :create_account 

  def create_account
    account = @twilio.accounts.create(friendly_name: @conference.name)
    self.sid = account.sid
    self.token = account.auth_token

    phone_number = first_number.phone_number
    account.incoming_phone_numbers.create(phone_number: phone_number)
    self.number = phone_number
  end

  private

  def first_number
    @twilio.available_phone_numbers.get('US').local.list().first
  end
end
