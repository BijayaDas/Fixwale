require 'test_helper'

class ConnectingServices::RepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @connecting_services_reply = connecting_services_replies(:one)
  end

  test "should get index" do
    get connecting_services_replies_url
    assert_response :success
  end

  test "should get new" do
    get new_connecting_services_reply_url
    assert_response :success
  end

  test "should create connecting_services_reply" do
    assert_difference('ConnectingServices::Reply.count') do
      post connecting_services_replies_url, params: { connecting_services_reply: {  } }
    end

    assert_redirected_to connecting_services_reply_url(ConnectingServices::Reply.last)
  end

  test "should show connecting_services_reply" do
    get connecting_services_reply_url(@connecting_services_reply)
    assert_response :success
  end

  test "should get edit" do
    get edit_connecting_services_reply_url(@connecting_services_reply)
    assert_response :success
  end

  test "should update connecting_services_reply" do
    patch connecting_services_reply_url(@connecting_services_reply), params: { connecting_services_reply: {  } }
    assert_redirected_to connecting_services_reply_url(@connecting_services_reply)
  end

  test "should destroy connecting_services_reply" do
    assert_difference('ConnectingServices::Reply.count', -1) do
      delete connecting_services_reply_url(@connecting_services_reply)
    end

    assert_redirected_to connecting_services_replies_url
  end
end
