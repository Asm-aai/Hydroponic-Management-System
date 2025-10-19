require "test_helper"

class MasurementsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get masurements_new_url
    assert_response :success
  end

  test "should get index" do
    get masurements_index_url
    assert_response :success
  end

  test "should get show" do
    get masurements_show_url
    assert_response :success
  end

  test "should get edit" do
    get masurements_edit_url
    assert_response :success
  end
end
