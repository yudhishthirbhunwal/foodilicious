require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  # test "invalid signup information" do
  #   assert_no_difference 'User.count' do
  #     post user_registration_path, params: { user: {first_name: "",
  #                                                   last_name: "",
  #                                                   phone_number: "984531211",
  #                                                   email: "user@invalid",
  #                                                   password: "foobar",
  #                                                   password_confirmation: "foobar"} }
  #   end
  #   assert_template 'devise/registrations/new'
  #   assert_select 'div#<CSS id for error explanation>'
  #   assert_select 'div.<CSS class for field with error>'
  # end

  # test "valid signup information" do
  #   assert_difference 'User.count', 1 do
  #     post user_registration_path, params: { user: {first_name: "Test",
  #                                                   last_name: "User",
  #                                                   phone_number: "9414022233",
  #                                                   email: "user@test.com",
  #                                                   password: "@Foobar1",
  #                                                   password_confirmation: "@Foobar1"} }
  #   end
  #   follow_redirect
  #   assert_template 'static_pages/home'
  #   assert_select 'div#<CSS id for error explanation>'
  #   assert_select 'div.<CSS class for field with error>'
  # end
end
