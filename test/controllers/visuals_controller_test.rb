require "test_helper"

class VisualsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @visual = visuals(:one)
    sign_in users(:one)

  end

  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get new" do
    get new_visual_url
    assert_response :success
  end

  test "should create visual" do
    assert_difference("Visual.count") do
      post visuals_url, params: { visual: { image: @visual.image } }
    end

    assert_redirected_to visual_url(Visual.last)
  end

  test "should show visual" do
    get visual_url(@visual)
    assert_response :success
  end

  test "should get edit" do
    get edit_visual_url(@visual)
    assert_response :success
  end

  test "should update visual" do
    patch visual_url(@visual), params: { visual: { image: @visual.image } }
    assert_redirected_to visual_url(@visual)
  end

  test "should destroy visual" do
    assert_difference("Visual.count", -1) do
      delete visual_url(@visual)
    end

    assert_redirected_to visuals_url
  end
end
