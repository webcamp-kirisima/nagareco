require 'test_helper'

class SellsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sells_new_url
    assert_response :success
  end

  test "should get create" do
    get sells_create_url
    assert_response :success
  end

  test "should get show" do
    get sells_show_url
    assert_response :success
  end

  test "should get finished" do
    get sells_finished_url
    assert_response :success
  end

end
