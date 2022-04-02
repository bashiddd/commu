require 'test_helper'

class CommuControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get commu_top_url
    assert_response :success
  end

end
