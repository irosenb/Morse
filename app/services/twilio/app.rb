module Twilio
  class App
    include Rails.application.routes.url_helpers
    attr_accessor :conference, :account

    def initialize(conference, account)
      @conference = conference  
      @account = account  
    end

    def create
      app = @account.applications.create(friendly_name: @conference.name, voice_url: dequeue_link, voice_method: "GET")
      app.sid
    end
    
    private 

    def dequeue_link
      conference_twilio_accounts_dequeue_url(@conference, host: "morse-demo.herokuapp.com")
    end
  end
end