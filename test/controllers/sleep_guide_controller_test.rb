require 'test_helper'

class SleepGuideControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
