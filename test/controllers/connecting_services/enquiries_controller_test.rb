require 'test_helper'

class ConnectingServices::EnquiriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @connecting_services_enquiry = connecting_services_enquiries(:one)
  end

  test "should get index" do
    get connecting_services_enquiries_url
    assert_response :success
  end

  test "should get new" do
    get new_connecting_services_enquiry_url
    assert_response :success
  end

  test "should create connecting_services_enquiry" do
    assert_difference('ConnectingServices::Enquiry.count') do
      post connecting_services_enquiries_url, params: { connecting_services_enquiry: {  } }
    end

    assert_redirected_to connecting_services_enquiry_url(ConnectingServices::Enquiry.last)
  end

  test "should show connecting_services_enquiry" do
    get connecting_services_enquiry_url(@connecting_services_enquiry)
    assert_response :success
  end

  test "should get edit" do
    get edit_connecting_services_enquiry_url(@connecting_services_enquiry)
    assert_response :success
  end

  test "should update connecting_services_enquiry" do
    patch connecting_services_enquiry_url(@connecting_services_enquiry), params: { connecting_services_enquiry: {  } }
    assert_redirected_to connecting_services_enquiry_url(@connecting_services_enquiry)
  end

  test "should destroy connecting_services_enquiry" do
    assert_difference('ConnectingServices::Enquiry.count', -1) do
      delete connecting_services_enquiry_url(@connecting_services_enquiry)
    end

    assert_redirected_to connecting_services_enquiries_url
  end
end
