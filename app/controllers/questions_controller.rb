class QuestionsController < ApplicationController
  def index 
    @conference = Conference.find(params[:conference_id])

    sid = @conference.sid
    auth_token = @conference.token

    capability = Twilio::Util::Capability.new sid, auth_token
    capability.allow_client_outgoing @conference.app_sid
    @token = capability.generate
    render "index"
  end

  def new
  end

  def call
    @conference = Conference.find(params[:conference_id])
  end
end
