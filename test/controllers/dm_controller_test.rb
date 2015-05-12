require 'test_helper'

class DmControllerTest < ActionController::TestCase
  test "should get creator" do
    get :creator
    assert_response :success
  end
  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end
end
