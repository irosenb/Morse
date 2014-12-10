require 'rails_helper'

RSpec.describe TwilioAccount, :type => :model do
	it { should belong_to(:conference) }
  
  context "before_create" do
  	it "should " do
  		
  	end
  end
end
