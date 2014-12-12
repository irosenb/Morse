class TwilioAccountsController < ApplicationController
  def call
    @conference = Conference.find(params[:conference_id])
  end

  def queue
    @conference = Conference.find(params[:conference_id])
  end
end
