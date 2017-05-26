require 'test_helper'

class FullTimeEmploymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @full_time_employment = full_time_employments(:one)
  end

  test "should get index" do
    get full_time_employments_url
    assert_response :success
  end

  test "should get new" do
    get new_full_time_employment_url
    assert_response :success
  end

  test "should create full_time_employment" do
    assert_difference('FullTimeEmployment.count') do
      post full_time_employments_url, params: { full_time_employment: {  } }
    end

    assert_redirected_to full_time_employment_url(FullTimeEmployment.last)
  end

  test "should show full_time_employment" do
    get full_time_employment_url(@full_time_employment)
    assert_response :success
  end

  test "should get edit" do
    get edit_full_time_employment_url(@full_time_employment)
    assert_response :success
  end

  test "should update full_time_employment" do
    patch full_time_employment_url(@full_time_employment), params: { full_time_employment: {  } }
    assert_redirected_to full_time_employment_url(@full_time_employment)
  end

  test "should destroy full_time_employment" do
    assert_difference('FullTimeEmployment.count', -1) do
      delete full_time_employment_url(@full_time_employment)
    end

    assert_redirected_to full_time_employments_url
  end
end
