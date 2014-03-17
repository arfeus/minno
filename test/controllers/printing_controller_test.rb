require 'test_helper'

class PrintingControllerTest < ActionController::TestCase
  test "should get print" do
    get :print
    assert_response :success
  end

end
