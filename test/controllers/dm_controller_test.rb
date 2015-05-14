require 'test_helper'

class DmControllerTest < ActionController::TestCase
  def setup
    @user = users(:testuser)
    @other_user = users(:archer)
  end
  
  test "get creator without login causes redirect" do
    get :creator
    assert_response :redirect
    log_in_as(@user)
    get :creator
    assert_response :success    
  end
  
  test "get dashboard without login causes redirect" do
    get :dashboard
    assert_response :redirect
    log_in_as(@user)
    get :creator
    assert_response :success 
  end
  
end
