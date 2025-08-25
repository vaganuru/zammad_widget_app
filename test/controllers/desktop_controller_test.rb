require "test_helper"

class DesktopControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get desktop_index_url
    assert_response :success
  end
end
