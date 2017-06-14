require 'test_helper'

class StaffingServices::PreVarifiedResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staffing_services_pre_varified_resource = staffing_services_pre_varified_resources(:one)
  end

  test "should get index" do
    get staffing_services_pre_varified_resources_url
    assert_response :success
  end

  test "should get new" do
    get new_staffing_services_pre_varified_resource_url
    assert_response :success
  end

  test "should create staffing_services_pre_varified_resource" do
    assert_difference('StaffingServices::PreVarifiedResource.count') do
      post staffing_services_pre_varified_resources_url, params: { staffing_services_pre_varified_resource: {  } }
    end

    assert_redirected_to staffing_services_pre_varified_resource_url(StaffingServices::PreVarifiedResource.last)
  end

  test "should show staffing_services_pre_varified_resource" do
    get staffing_services_pre_varified_resource_url(@staffing_services_pre_varified_resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_staffing_services_pre_varified_resource_url(@staffing_services_pre_varified_resource)
    assert_response :success
  end

  test "should update staffing_services_pre_varified_resource" do
    patch staffing_services_pre_varified_resource_url(@staffing_services_pre_varified_resource), params: { staffing_services_pre_varified_resource: {  } }
    assert_redirected_to staffing_services_pre_varified_resource_url(@staffing_services_pre_varified_resource)
  end

  test "should destroy staffing_services_pre_varified_resource" do
    assert_difference('StaffingServices::PreVarifiedResource.count', -1) do
      delete staffing_services_pre_varified_resource_url(@staffing_services_pre_varified_resource)
    end

    assert_redirected_to staffing_services_pre_varified_resources_url
  end
end
