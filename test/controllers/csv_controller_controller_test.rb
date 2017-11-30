require 'test_helper'

class CsvControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get import" do
    get csv_controller_import_url
    assert_response :success
  end

  test "should get show" do
    get csv_controller_show_url
    assert_response :success
  end

end
