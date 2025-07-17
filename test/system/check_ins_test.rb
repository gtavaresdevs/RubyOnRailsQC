require "application_system_test_case"

class CheckInsTest < ApplicationSystemTestCase
  setup do
    @check_in = check_ins(:one)
  end

  test "visiting the index" do
    visit check_ins_url
    assert_selector "h1", text: "Check ins"
  end

  test "should create check in" do
    visit check_ins_url
    click_on "New check in"

    fill_in "Content", with: @check_in.content
    fill_in "User", with: @check_in.user
    click_on "Create Check in"

    assert_text "Check in was successfully created"
    click_on "Back"
  end

  test "should update Check in" do
    visit check_in_url(@check_in)
    click_on "Edit this check in", match: :first

    fill_in "Content", with: @check_in.content
    fill_in "User", with: @check_in.user
    click_on "Update Check in"

    assert_text "Check in was successfully updated"
    click_on "Back"
  end

  test "should destroy Check in" do
    visit check_in_url(@check_in)
    click_on "Destroy this check in", match: :first

    assert_text "Check in was successfully destroyed"
  end
end
