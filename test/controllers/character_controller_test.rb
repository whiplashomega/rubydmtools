require 'test_helper'

class CharacterControllerTest < ActionController::TestCase
  def setup
    @user = users(:testuser)
  end
  
  test "create a character" do
    log_in_as(@user)
    assert_difference 'Character.count', 1 do
      get :create
    end
  end
  
  test "create a character without login" do
    assert_difference 'Character.count', 0 do
      get :create
    end
  end
  
end
