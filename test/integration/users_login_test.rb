require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest


  # def setup
  #   @user = users(:userone)
  # end

  # test "login with valid information" do
  #   get new_user_session_path
  #   post user_session_path, params: { user: { email: @user.email,
  #                                         password: '@Foobar1' } }
      # assert is_logged_in?
  #   assert_redirected_to @user
  #   follow_redirect!
  #   assert_template 'static_pages/home'
  #   assert_select "a[href=?]", new_user_session_path, count: 0
  #   assert_select "a[href=?]", destroy_user_session_path
  #   assert_select "a[href=?]", user_path(@user)
      # delete logout_path
      # assert_not is_logged_in?
      # assert_redirected_to root_url
      # follow_redirect!
      # delete logout_path
      # assert_select "a[href=?]", login_path
      # assert_select "a[href=?]", logout_path, count: 0
      # assert_select "a[href=?]", user_path(@user), count: 0
  # end

  # test "login with valid email/invalid password" do
  #   get new_user_session_path
  #   assert_template 'devise/sessions/new'
  #   post user_session_path, params: { user: { email: @user.email,
  #                                             password: "invalid" } }
      # assert_not is_logged_in?
  #   assert_template 'devise/sessions/new'
    # assert_not flash.empty?
    # get root_path
    # assert flash.empty?
  # end

  # test "login with remembering" do
  #   log_in_as(@user, remember_me: '1')
  #   assert_not_empty cookies[:remember_token]
  # end
  # test "login without remembering" do
  #   # Log in to set the cookie.
  #   log_in_as(@user, remember_me: '1')
  #   # Log in again and verify that the cookie is deleted.
  #   log_in_as(@user, remember_me: '0')
  #   assert_empty cookies[:remember_token]
  # end
end
