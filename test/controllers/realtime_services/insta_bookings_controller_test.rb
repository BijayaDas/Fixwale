require 'test_helper'

class RealtimeServices::InstaBookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @realtime_services_insta_booking = realtime_services_insta_bookings(:one)
  end

  test "should get index" do
    get realtime_services_insta_bookings_url
    assert_response :success
  end

  test "should get new" do
    get new_realtime_services_insta_booking_url
    assert_response :success
  end

  test "should create realtime_services_insta_booking" do
    assert_difference('RealtimeServices::InstaBooking.count') do
      post realtime_services_insta_bookings_url, params: { realtime_services_insta_booking: {  } }
    end

    assert_redirected_to realtime_services_insta_booking_url(RealtimeServices::InstaBooking.last)
  end

  test "should show realtime_services_insta_booking" do
    get realtime_services_insta_booking_url(@realtime_services_insta_booking)
    assert_response :success
  end

  test "should get edit" do
    get edit_realtime_services_insta_booking_url(@realtime_services_insta_booking)
    assert_response :success
  end

  test "should update realtime_services_insta_booking" do
    patch realtime_services_insta_booking_url(@realtime_services_insta_booking), params: { realtime_services_insta_booking: {  } }
    assert_redirected_to realtime_services_insta_booking_url(@realtime_services_insta_booking)
  end

  test "should destroy realtime_services_insta_booking" do
    assert_difference('RealtimeServices::InstaBooking.count', -1) do
      delete realtime_services_insta_booking_url(@realtime_services_insta_booking)
    end

    assert_redirected_to realtime_services_insta_bookings_url
  end
end
