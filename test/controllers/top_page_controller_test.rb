require 'test_helper'

class TopPageControllerTest < ActionDispatch::IntegrationTest
  test "root_path" do
    get root_path
    assert_response :success
  end
end
