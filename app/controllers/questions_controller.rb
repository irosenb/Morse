class QuestionsController < ApplicationController
  def index 
    sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']

    capability = Twilio::Util::Capability.new sid, auth_token
    capability.allow_client_incoming "isaac"
    token = capability.generate
    render "index", :locals => { token: token }
  end

  def new
  end

  def ask
  end

  def call
  end
end
