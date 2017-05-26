require 'test_helper'

class PremiumEmploymentServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @premium_employment_service = premium_employment_services(:one)
  end

  test "should get index" do
    get premium_employment_services_url
    assert_response :success
  end

  test "should get new" do
    get new_premium_employment_service_url
    assert_response :success
  end

  test "should create premium_employment_service" do
    assert_difference('PremiumEmploymentService.count') do
      post premium_employment_services_url, params: { premium_employment_service: { active: @premium_employment_service.active, attempts_limit: @premium_employment_service.attempts_limit, current_attempt: @premium_employment_service.current_attempt, offered_ctc: @premium_employment_service.offered_ctc, paid_ammount: @premium_employment_service.paid_ammount, placed: @premium_employment_service.placed, placed_in: @premium_employment_service.placed_in } }
    end

    assert_redirected_to premium_employment_service_url(PremiumEmploymentService.last)
  end

  test "should show premium_employment_service" do
    get premium_employment_service_url(@premium_employment_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_premium_employment_service_url(@premium_employment_service)
    assert_response :success
  end

  test "should update premium_employment_service" do
    patch premium_employment_service_url(@premium_employment_service), params: { premium_employment_service: { active: @premium_employment_service.active, attempts_limit: @premium_employment_service.attempts_limit, current_attempt: @premium_employment_service.current_attempt, offered_ctc: @premium_employment_service.offered_ctc, paid_ammount: @premium_employment_service.paid_ammount, placed: @premium_employment_service.placed, placed_in: @premium_employment_service.placed_in } }
    assert_redirected_to premium_employment_service_url(@premium_employment_service)
  end

  test "should destroy premium_employment_service" do
    assert_difference('PremiumEmploymentService.count', -1) do
      delete premium_employment_service_url(@premium_employment_service)
    end

    assert_redirected_to premium_employment_services_url
  end
end
