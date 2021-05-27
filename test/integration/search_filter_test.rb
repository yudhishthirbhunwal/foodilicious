require "test_helper"

class SearchFilterTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @admin.add_role(:admin)
    @buyer = users(:buyerone)
    @buyer.add_role(:buyer)
    @seller = users(:sellerone)
    @seller.add_role(:seller)
  end

  test "should verify search and filter features" do
    sign_in(@admin)
    get users_path
    assert_response :success
    assert_select "a[href=?]", user_path(@seller)
    assert_select "nav.pagination"
    get users_path params: { keywords: "seller1" }
    assert_select "a[href=?]", user_path(@seller)
    get users_path params: { keywords: "buyer4" }
    assert_select "a[href=?]", user_path(users(:buyerfour))
    get users_path params: { keywords: "buy4" }
    assert_not flash.empty?
    assert_equal "'buy4' not found in Users", flash[:alert]
    get food_items_path
    assert_response :success
    assert_select "div.food_index_search>form"
    get food_items_path params: { keywords: "choco", filters: "Filter by: Default" }
    assert_equal "'choco' not found in Food Items", flash[:alert]
    get food_items_path params: { keywords: "", filters: "Price (Low to High)" }
    assert_select "h5>a[href=?]", food_item_path(food_items(:plum))
    # assert (food_items.each_cons(2){|a,b| a.price <= b.price})
  end
end
