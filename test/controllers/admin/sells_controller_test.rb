require 'test_helper'

class Admin::SellsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_sells_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_sells_show_url
    assert_response :success
  end

  test "should get update" do
    get admin_sells_update_url
    assert_response :success
  end

end
