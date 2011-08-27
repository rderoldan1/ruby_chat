require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get site_index" do
    get :site_index
    assert_response :success
  end

end
