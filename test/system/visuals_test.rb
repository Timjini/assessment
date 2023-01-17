require "application_system_test_case"

class VisualsTest < ApplicationSystemTestCase
  setup do
    @visual = visuals(:one)
  end

  test "visiting the index" do
    visit visuals_url
    assert_selector "h1", text: "Visuals"
  end

  test "should create visual" do
    visit visuals_url
    click_on "New visual"

    fill_in "Image", with: @visual.image
    click_on "Create Visual"

    assert_text "Visual was successfully created"
    click_on "Back"
  end

  test "should update Visual" do
    visit visual_url(@visual)
    click_on "Edit this visual", match: :first

    fill_in "Image", with: @visual.image
    click_on "Update Visual"

    assert_text "Visual was successfully updated"
    click_on "Back"
  end

  test "should destroy Visual" do
    visit visual_url(@visual)
    click_on "Destroy this visual", match: :first

    assert_text "Visual was successfully destroyed"
  end
end
