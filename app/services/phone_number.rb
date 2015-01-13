class PhoneNumber
  include Rails.application.routes.url_helpers
  attr_accessor :conference, :account

  def initialize(conference, account)
    @conference = conference  
    @account = account  
  end

  def create
    phone_number = first_number
    @account.incoming_phone_numbers.create(phone_number: phone_number, voice_url: conference_link, voice_method: "GET") 
    phone_number
  end

  def first_number
    TWILIO.available_phone_numbers.get('US').local.list().first.phone_number
  end

  def conference_link
    conference_twilio_accounts_queue_url(@conference, host: "morse-demo.herokuapp.com")
  end
end

