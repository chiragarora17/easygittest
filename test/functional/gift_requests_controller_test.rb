require 'test_helper'

class GiftRequestsControllerTest < ActionController::TestCase
  setup do
    @gift_request = gift_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gift_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gift_request" do
    assert_difference('GiftRequest.count') do
      post :create, gift_request: {  }
    end

    assert_redirected_to gift_request_path(assigns(:gift_request))
  end

  test "should show gift_request" do
    get :show, id: @gift_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gift_request
    assert_response :success
  end

  test "should update gift_request" do
    put :update, id: @gift_request, gift_request: {  }
    assert_redirected_to gift_request_path(assigns(:gift_request))
  end

  test "should destroy gift_request" do
    assert_difference('GiftRequest.count', -1) do
      delete :destroy, id: @gift_request
    end

    assert_redirected_to gift_requests_path
  end
end
