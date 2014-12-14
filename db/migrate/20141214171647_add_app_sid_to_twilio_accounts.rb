class AddAppSidToTwilioAccounts < ActiveRecord::Migration
  def change
    add_column :twilio_accounts, :app_sid, :string
  end
end
