class Subaccount
  def self.create(name)
    TWILIO.accounts.create(friendly_name: name)
  end

  def self.destroy(sid)
    account = TWILIO.accounts.get(sid)
    account.update(status: "closed") 
  end
end