require 'test_helper'

class PurposesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get purposes_index_url
    assert_response :success
  end

end
