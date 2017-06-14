require 'test_helper'

class ScheduledServices::OfficeAppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scheduled_services_office_appointment = scheduled_services_office_appointments(:one)
  end

  test "should get index" do
    get scheduled_services_office_appointments_url
    assert_response :success
  end

  test "should get new" do
    get new_scheduled_services_office_appointment_url
    assert_response :success
  end

  test "should create scheduled_services_office_appointment" do
    assert_difference('ScheduledServices::OfficeAppointment.count') do
      post scheduled_services_office_appointments_url, params: { scheduled_services_office_appointment: {  } }
    end

    assert_redirected_to scheduled_services_office_appointment_url(ScheduledServices::OfficeAppointment.last)
  end

  test "should show scheduled_services_office_appointment" do
    get scheduled_services_office_appointment_url(@scheduled_services_office_appointment)
    assert_response :success
  end

  test "should get edit" do
    get edit_scheduled_services_office_appointment_url(@scheduled_services_office_appointment)
    assert_response :success
  end

  test "should update scheduled_services_office_appointment" do
    patch scheduled_services_office_appointment_url(@scheduled_services_office_appointment), params: { scheduled_services_office_appointment: {  } }
    assert_redirected_to scheduled_services_office_appointment_url(@scheduled_services_office_appointment)
  end

  test "should destroy scheduled_services_office_appointment" do
    assert_difference('ScheduledServices::OfficeAppointment.count', -1) do
      delete scheduled_services_office_appointment_url(@scheduled_services_office_appointment)
    end

    assert_redirected_to scheduled_services_office_appointments_url
  end
end
