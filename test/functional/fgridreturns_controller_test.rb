require 'test_helper'

class FgridreturnsControllerTest < ActionController::TestCase
  test "should get getalldonars" do
    get :getalldonars
    assert_response :success
  end

end
