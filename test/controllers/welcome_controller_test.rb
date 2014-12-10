require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get demo" do
    get :demo
    assert_response :success
  end

end
