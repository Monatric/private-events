require "test_helper"

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  test "should get join" do
    get attendances_join_url
    assert_response :success
  end
end
