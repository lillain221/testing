require "application_system_test_case"

class MenTest < ApplicationSystemTestCase
  setup do
    @man = men(:one)
  end

  test "visiting the index" do
    visit men_url
    assert_selector "h1", text: "Men"
  end

  test "should create man" do
    visit men_url
    click_on "New man"

    fill_in "Age", with: @man.age
    fill_in "Name", with: @man.name
    click_on "Create Man"

    assert_text "Man was successfully created"
    click_on "Back"
  end

  test "should update Man" do
    visit man_url(@man)
    click_on "Edit this man", match: :first

    fill_in "Age", with: @man.age
    fill_in "Name", with: @man.name
    click_on "Update Man"

    assert_text "Man was successfully updated"
    click_on "Back"
  end

  test "should destroy Man" do
    visit man_url(@man)
    click_on "Destroy this man", match: :first

    assert_text "Man was successfully destroyed"
  end
end
