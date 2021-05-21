require "test_helper"

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @user = users(:buyerone)
  end

  test "index including pagination" do
    get new_user_session_path
    assert_response :success
    sign_in(@admin)
    post user_session_path
    assert_response :redirect
    follow_redirect!
    assert_not flash.empty?
    assert_response :success
    get users_path
    assert_response :success
    # assert_select 'nav'#.pagination'
    # first_page_of_users = User.page(1)
    # # puts "-------------------------------------------"
    # # puts "-------------------------------------------"
    # # puts first_page_of_users
    # # puts "-------------------------------------------"
    # # puts "-------------------------------------------"
    # first_page_of_users.each do |user|
    #   assert_select 'a[href=?]', user_path(user), text: full_name(user)
    #   unless user == @admin
    #     assert_select 'a[href=?]', user_path(user), text: 'delete'
    #   end
    # end
    # assert_difference 'User.count', -1 do
    #   delete user_path(@user)
    # end
  end

  # test "index as non-admin" do
  #   log_in_as(@non_admin)
  #   get users_path
  #   assert_select 'a', text: 'delete', count: 0
  # end
end
