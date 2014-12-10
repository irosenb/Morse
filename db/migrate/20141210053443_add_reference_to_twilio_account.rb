class AddReferenceToTwilioAccount < ActiveRecord::Migration
  def change
    add_reference :twilio_accounts, :conference, index: true
  end
end
