require 'test_helper'

class TwilioAccountsControllerTest < ActionController::TestCase
  test "should get call" do
    get :call
    assert_response :success
  end

end
