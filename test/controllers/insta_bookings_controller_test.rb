require 'test_helper'

class InstaBookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @insta_booking = insta_bookings(:one)
  end

  test "should get index" do
    get insta_bookings_url
    assert_response :success
  end

  test "should get new" do
    get new_insta_booking_url
    assert_response :success
  end

  test "should create insta_booking" do
    assert_difference('InstaBooking.count') do
      post insta_bookings_url, params: { insta_booking: { active: @insta_booking.active, category_id: @insta_booking.category_id, date: @insta_booking.date, description: @insta_booking.description, hours: @insta_booking.hours, payment_due: @insta_booking.payment_due, time: @insta_booking.time, user_id: @insta_booking.user_id } }
    end

    assert_redirected_to insta_booking_url(InstaBooking.last)
  end

  test "should show insta_booking" do
    get insta_booking_url(@insta_booking)
    assert_response :success
  end

  test "should get edit" do
    get edit_insta_booking_url(@insta_booking)
    assert_response :success
  end

  test "should update insta_booking" do
    patch insta_booking_url(@insta_booking), params: { insta_booking: { active: @insta_booking.active, category_id: @insta_booking.category_id, date: @insta_booking.date, description: @insta_booking.description, hours: @insta_booking.hours, payment_due: @insta_booking.payment_due, time: @insta_booking.time, user_id: @insta_booking.user_id } }
    assert_redirected_to insta_booking_url(@insta_booking)
  end

  test "should destroy insta_booking" do
    assert_difference('InstaBooking.count', -1) do
      delete insta_booking_url(@insta_booking)
    end

    assert_redirected_to insta_bookings_url
  end
end
