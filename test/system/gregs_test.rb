require "application_system_test_case"

class GregsTest < ApplicationSystemTestCase
  setup do
    @greg = gregs(:one)
  end

  test "visiting the index" do
    visit gregs_url
    assert_selector "h1", text: "Gregs"
  end

  test "should create greg" do
    visit gregs_url
    click_on "New greg"

    fill_in "Email", with: @greg.email
    fill_in "Name", with: @greg.name
    fill_in "Tel", with: @greg.tel
    click_on "Create Greg"

    assert_text "Greg was successfully created"
    click_on "Back"
  end

  test "should update Greg" do
    visit greg_url(@greg)
    click_on "Edit this greg", match: :first

    fill_in "Email", with: @greg.email
    fill_in "Name", with: @greg.name
    fill_in "Tel", with: @greg.tel
    click_on "Update Greg"

    assert_text "Greg was successfully updated"
    click_on "Back"
  end

  test "should destroy Greg" do
    visit greg_url(@greg)
    click_on "Destroy this greg", match: :first

    assert_text "Greg was successfully destroyed"
  end
end
