class TwilioAccountsController < ApplicationController
  before_action :set_conference
  
  def call
  end

  def queue
  end

  def dequeue
  end

  private 
  def set_conference
    @conference = Conference.find(params[:conference_id])
  end
end
