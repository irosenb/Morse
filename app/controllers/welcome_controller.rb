class WelcomeController < ApplicationController
  def show
  end

  def demo
    sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']

    capability = Twilio::Util::Capability.new sid, auth_token
    capability.allow_client_incoming "isaac"
    token = capability.generate
    render "demo", :locals => { token: token }
  end

  def call
  end
end
