require 'test_helper'

class PreVarifiedResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pre_varified_resource = pre_varified_resources(:one)
  end

  test "should get index" do
    get pre_varified_resources_url
    assert_response :success
  end

  test "should get new" do
    get new_pre_varified_resource_url
    assert_response :success
  end

  test "should create pre_varified_resource" do
    assert_difference('PreVarifiedResource.count') do
      post pre_varified_resources_url, params: { pre_varified_resource: { budget: @pre_varified_resource.budget, designation: @pre_varified_resource.designation, expert_level: @pre_varified_resource.expert_level, need_before: @pre_varified_resource.need_before, skill_sets: @pre_varified_resource.skill_sets, years_experience: @pre_varified_resource.years_experience } }
    end

    assert_redirected_to pre_varified_resource_url(PreVarifiedResource.last)
  end

  test "should show pre_varified_resource" do
    get pre_varified_resource_url(@pre_varified_resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_pre_varified_resource_url(@pre_varified_resource)
    assert_response :success
  end

  test "should update pre_varified_resource" do
    patch pre_varified_resource_url(@pre_varified_resource), params: { pre_varified_resource: { budget: @pre_varified_resource.budget, designation: @pre_varified_resource.designation, expert_level: @pre_varified_resource.expert_level, need_before: @pre_varified_resource.need_before, skill_sets: @pre_varified_resource.skill_sets, years_experience: @pre_varified_resource.years_experience } }
    assert_redirected_to pre_varified_resource_url(@pre_varified_resource)
  end

  test "should destroy pre_varified_resource" do
    assert_difference('PreVarifiedResource.count', -1) do
      delete pre_varified_resource_url(@pre_varified_resource)
    end

    assert_redirected_to pre_varified_resources_url
  end
end
