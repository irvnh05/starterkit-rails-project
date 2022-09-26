require 'test_helper'

class RecapSalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recap_sale = recap_sales(:one)
  end

  test "should get index" do
    get recap_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_recap_sale_url
    assert_response :success
  end

  test "should create recap_sale" do
    assert_difference('RecapSale.count') do
      post recap_sales_url, params: { recap_sale: {  } }
    end

    assert_redirected_to recap_sale_url(RecapSale.last)
  end

  test "should show recap_sale" do
    get recap_sale_url(@recap_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_recap_sale_url(@recap_sale)
    assert_response :success
  end

  test "should update recap_sale" do
    patch recap_sale_url(@recap_sale), params: { recap_sale: {  } }
    assert_redirected_to recap_sale_url(@recap_sale)
  end

  test "should destroy recap_sale" do
    assert_difference('RecapSale.count', -1) do
      delete recap_sale_url(@recap_sale)
    end

    assert_redirected_to recap_sales_url
  end
end
