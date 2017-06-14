require 'test_helper'

class EmploymentServices::PremiumEmploymentServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employment_services_premium_employment_service = employment_services_premium_employment_services(:one)
  end

  test "should get index" do
    get employment_services_premium_employment_services_url
    assert_response :success
  end

  test "should get new" do
    get new_employment_services_premium_employment_service_url
    assert_response :success
  end

  test "should create employment_services_premium_employment_service" do
    assert_difference('EmploymentServices::PremiumEmploymentService.count') do
      post employment_services_premium_employment_services_url, params: { employment_services_premium_employment_service: {  } }
    end

    assert_redirected_to employment_services_premium_employment_service_url(EmploymentServices::PremiumEmploymentService.last)
  end

  test "should show employment_services_premium_employment_service" do
    get employment_services_premium_employment_service_url(@employment_services_premium_employment_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_employment_services_premium_employment_service_url(@employment_services_premium_employment_service)
    assert_response :success
  end

  test "should update employment_services_premium_employment_service" do
    patch employment_services_premium_employment_service_url(@employment_services_premium_employment_service), params: { employment_services_premium_employment_service: {  } }
    assert_redirected_to employment_services_premium_employment_service_url(@employment_services_premium_employment_service)
  end

  test "should destroy employment_services_premium_employment_service" do
    assert_difference('EmploymentServices::PremiumEmploymentService.count', -1) do
      delete employment_services_premium_employment_service_url(@employment_services_premium_employment_service)
    end

    assert_redirected_to employment_services_premium_employment_services_url
  end
end
