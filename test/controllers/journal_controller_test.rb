require 'test_helper'

class JournalControllerTest < ActionController::TestCase
  def setup
    @user = users(:testuser)
  end
  
  test "create a journal" do
    log_in_as(@user)
    assert_difference 'Journal.count', 1 do
      post :create, journal: {date: "Dorunor 1, 1844", text: "Journal Text"}
    end
  end
  
  test "create a journal without login" do
    assert_difference 'Journal.count', 0 do
      post :create, journal: {date: "Dorunor 1, 1844", text: "Journal Text"}
    end
  end
end
