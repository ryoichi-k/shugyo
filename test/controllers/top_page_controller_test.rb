require 'test_helper'

class TopPageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get top_page_home_url
    assert_response :success
  end

end
