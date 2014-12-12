class QuestionsController < ApplicationController
  def index 
    @conference = Conference.find(params[:conference_id])

    sid = @conference.sid
    auth_token = @conference.token

    capability = Twilio::Util::Capability.new sid, auth_token
    capability.allow_client_incoming @conference.name
    capability.allow_client_outgoing "APcfdb3515c62f13492b7e4e0df4dddf95"
    token = capability.generate
    render "index", :locals => { token: token }
  end

  def new
  end

  def call
    @conference = Conference.find(params[:conference_id])
  end
end
