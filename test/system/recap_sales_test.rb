require "application_system_test_case"

class RecapSalesTest < ApplicationSystemTestCase
  setup do
    @recap_sale = recap_sales(:one)
  end

  test "visiting the index" do
    visit recap_sales_url
    assert_selector "h1", text: "Recap Sales"
  end

  test "creating a Recap sale" do
    visit recap_sales_url
    click_on "New Recap Sale"

    click_on "Create Recap sale"

    assert_text "Recap sale was successfully created"
    click_on "Back"
  end

  test "updating a Recap sale" do
    visit recap_sales_url
    click_on "Edit", match: :first

    click_on "Update Recap sale"

    assert_text "Recap sale was successfully updated"
    click_on "Back"
  end

  test "destroying a Recap sale" do
    visit recap_sales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recap sale was successfully destroyed"
  end
end
