require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:buyerone)
  end

  test "unsuccessful edit" do
    sign_in @user
    get edit_user_registration_path(@user)
    assert_template 'devise/registrations/edit'
    patch user_registration_path params: { user: {first_name: "",
                                                          last_name: "",
                                                          phone_number: "",
                                                          email: "foo@invalid",
                                                          password: "foo",
                                                          password_confirmation: "bar" } }
    assert_template 'devise/registrations/edit'
  end

  test "successful edit" do
    sign_in @user
    get edit_user_registration_path(@user)
    assert_template 'devise/registrations/edit'
    first_name = "Foo"
    last_name = "Bar"
    phone_number = "999999990"
    email = "foo@bar.com"
    patch user_registration_path params: { user: {first_name: first_name,
                                                          last_name: last_name,
                                                          phone_number: phone_number,
                                                          email: email,
                                                          password: "@Foobar1",
                                                          password_confirmation: "@Foobar1" } }
    # assert_not flash.empty?
    # assert_redirected_to @user
    # @user.reload
    # assert_equal name, @user.name
    # assert_equal email, @user.email
  end
end
