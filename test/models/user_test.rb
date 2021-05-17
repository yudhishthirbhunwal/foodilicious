require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new( first_name: "Yudhishthir", last_name: "Bhunwal",
                      phone_number: "8568500088", email: "yudhishthir@bhunwal.in",
                      password: "Foobar1@2", password_confirmation: "Foobar1@2" )
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "first name should be present" do
    @user.first_name = "    "
    assert_not @user.valid?
  end

  test "last name should be present" do
    @user.last_name = "    "
    assert_not @user.valid?
  end

  test "phone number should be present" do
    @user.phone_number = "    "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "first name should not be too long" do
    @user.first_name = "a" * 51
    assert_not @user.valid?
  end

  test "last name should not be too long" do
    @user.last_name = "a" * 51
    assert_not @user.valid?
  end

  test "phone number should be exactly 10 digits long" do
    @user.phone_number='8'*5
    assert_not @user.valid?
    @user.phone_number='9'*15
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "phonenumber validation should accept valid phone numbers" do
    valid_numbers = %w[9876543210 8888888888 1412424957]
    valid_numbers.each do |valid_number|
      @user.phone_number = valid_number
      assert @user.valid?, "#{valid_number.inspect} should be valid"
    end
  end

  test "phonenumber validation should reject invalid phone numbers" do
    invalid_numbers = %w[987654321 88888 01412424957 asdfghjkla w1w2w38989]
    invalid_numbers.each do |invalid_number|
      @user.phone_number = invalid_number
      assert_not @user.valid?, "#{invalid_number.inspect} should be valid"
    end
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com USERfoo.COM A_US-ER@fo-o.bar.or-g
      first.last@foo_.jp alice+bob@baz..cn user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "phone numbers should be unique" do
    duplicate_user = @user.dup
    duplicate_user.phone_number = @user.phone_number
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = "      "
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a"*5
    assert_not @user.valid?
  end

  test "password validation should accept passwords" do
    valid_passwords = %w[$foobar1Z fo$obarbPzx1 sdjfnsdkjE123# dslkfnPzlkdj$r3]
    valid_passwords.each do |valid_password|
      @user.password = @user.password_confirmation = valid_password
      assert @user.valid?, "#{valid_password.inspect} should be valid"
    end
  end

  test "password validation should reject passwords" do
    invalid_passwords = %w[foobar1Z foobarbazx1 sdsfsf 944916 32r34fv 4rse 4v4tse54t3]
    invalid_passwords.each do |invalid_password|
      @user.password = @user.password_confirmation = invalid_password
      assert_not @user.valid?, "#{invalid_password.inspect} should be invalid"
    end
  end
end
