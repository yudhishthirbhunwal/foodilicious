require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest


  def setup
    @user = users(:buyerone)
  end

  test "login with valid information" do
    get new_user_session_path
    assert_response :success
    post user_session_path params: { user: { email: @user.email,
                                          password: '@Foobar1' } }
    assert_response :redirect
    follow_redirect!
    assert_template 'static_pages/home'
    assert_select 'div.flash_message', "Signed in successfully."
    assert_select "a[href=?]", new_user_session_path, count: 0
    assert_select "a[href=?]", destroy_user_session_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", users_path
    delete destroy_user_session_path
    assert_response :redirect
    follow_redirect!
    assert_template 'static_pages/home'
    assert_select 'div.flash_message', "Signed out successfully."
    assert_select "a[href=?]", new_user_session_path
    assert_select "a[href=?]", destroy_user_session_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
    assert_select "a[href=?]", users_path, count: 0
  end
  
  test "login with valid email/invalid password" do
    get new_user_session_path
    assert_template 'devise/sessions/new'
    post user_session_path params: { user: { email: @user.email,
                                              password: "invalid" } }
    assert_template 'devise/sessions/new'
    assert_not flash.empty?
    assert_select 'div.flash_message', "Invalid Email or password."
  end

  test "login with remembering" do
    post user_session_path params: { user: { email: @user.email,
                                          password: '@Foobar1', remember_me: '1' } }
    assert_not_empty cookies[:remember_user_token]
  end

  test "login without remembering" do
    sign_in(@user)
    assert_nil cookies[:remember_user_token]
  end
end
