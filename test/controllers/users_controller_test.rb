require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get dash_bords" do
    get users_dash_bords_url
    assert_response :success
  end

end
