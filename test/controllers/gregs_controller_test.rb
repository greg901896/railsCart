require "test_helper"

class GregsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @greg = gregs(:one)
  end

  test "should get index" do
    get gregs_url
    assert_response :success
  end

  test "should get new" do
    get new_greg_url
    assert_response :success
  end

  test "should create greg" do
    assert_difference("Greg.count") do
      post gregs_url, params: { greg: { email: @greg.email, name: @greg.name, tel: @greg.tel } }
    end

    assert_redirected_to greg_url(Greg.last)
  end

  test "should show greg" do
    get greg_url(@greg)
    assert_response :success
  end

  test "should get edit" do
    get edit_greg_url(@greg)
    assert_response :success
  end

  test "should update greg" do
    patch greg_url(@greg), params: { greg: { email: @greg.email, name: @greg.name, tel: @greg.tel } }
    assert_redirected_to greg_url(@greg)
  end

  test "should destroy greg" do
    assert_difference("Greg.count", -1) do
      delete greg_url(@greg)
    end

    assert_redirected_to gregs_url
  end
end
