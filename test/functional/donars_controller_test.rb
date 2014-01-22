require 'test_helper'

class DonarsControllerTest < ActionController::TestCase
  test "should get listdonars" do
    get :listdonars
    assert_response :success
  end

end
