require 'test_helper'

class OfficeAppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_appointment = office_appointments(:one)
  end

  test "should get index" do
    get office_appointments_url
    assert_response :success
  end

  test "should get new" do
    get new_office_appointment_url
    assert_response :success
  end

  test "should create office_appointment" do
    assert_difference('OfficeAppointment.count') do
      post office_appointments_url, params: { office_appointment: { active: @office_appointment.active, date: @office_appointment.date, description: @office_appointment.description, hours: @office_appointment.hours, payment_due: @office_appointment.payment_due, time: @office_appointment.time } }
    end

    assert_redirected_to office_appointment_url(OfficeAppointment.last)
  end

  test "should show office_appointment" do
    get office_appointment_url(@office_appointment)
    assert_response :success
  end

  test "should get edit" do
    get edit_office_appointment_url(@office_appointment)
    assert_response :success
  end

  test "should update office_appointment" do
    patch office_appointment_url(@office_appointment), params: { office_appointment: { active: @office_appointment.active, date: @office_appointment.date, description: @office_appointment.description, hours: @office_appointment.hours, payment_due: @office_appointment.payment_due, time: @office_appointment.time } }
    assert_redirected_to office_appointment_url(@office_appointment)
  end

  test "should destroy office_appointment" do
    assert_difference('OfficeAppointment.count', -1) do
      delete office_appointment_url(@office_appointment)
    end

    assert_redirected_to office_appointments_url
  end
end
