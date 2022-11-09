require "test_helper"

class LenevoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lenevo_index_url
    assert_response :success
  end

  test "should get edit" do
    get lenevo_edit_url
    assert_response :success
  end

  test "should get show" do
    get lenevo_show_url
    assert_response :success
  end

  test "should get new" do
    get lenevo_new_url
    assert_response :success
  end
end
