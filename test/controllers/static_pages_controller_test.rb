require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about_me" do
    get static_pages_about_me_url
    assert_response :success
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
  end
end
