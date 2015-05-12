require 'test_helper'

class DmControllerTest < ActionController::TestCase
  test "get creator without login causes redirect" do
    get :creator
    assert_response :redirect
  end
  test "get dashboard without login causes redirect" do
    get :dashboard
    assert_response :redirect
  end
end
