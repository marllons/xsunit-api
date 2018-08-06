require 'test_helper'

class ReportSurvivorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report_survivor = report_survivors(:one)
  end

  test "should get index" do
    get report_survivors_url, as: :json
    assert_response :success
  end

  test "should create report_survivor" do
    assert_difference('ReportSurvivor.count') do
      post report_survivors_url, params: { report_survivor: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show report_survivor" do
    get report_survivor_url(@report_survivor), as: :json
    assert_response :success
  end

  test "should update report_survivor" do
    patch report_survivor_url(@report_survivor), params: { report_survivor: {  } }, as: :json
    assert_response 200
  end

  test "should destroy report_survivor" do
    assert_difference('ReportSurvivor.count', -1) do
      delete report_survivor_url(@report_survivor), as: :json
    end

    assert_response 204
  end
end
