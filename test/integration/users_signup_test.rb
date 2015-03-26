require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    usercount = User.count
    post users_path, user: { name: 'testname', email: 'user@invalid.com', password: 'foo', password_confirmation: 'foo'}
    #assert_no_difference 'User.count' do
    #  post users_path, user: { name: 'testname' email: "user@invalid", password: "foo", password_confirmation: "bar" }
    #end
    assert_template 'users/new'
  end
  # test "the truth" do
  #   assert true
  # end
end
