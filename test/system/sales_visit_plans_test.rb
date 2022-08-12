require "application_system_test_case"

class SalesVisitPlansTest < ApplicationSystemTestCase
  setup do
    @sales_visit_plan = sales_visit_plans(:one)
  end

  test "visiting the index" do
    visit sales_visit_plans_url
    assert_selector "h1", text: "Sales Visit Plans"
  end

  test "creating a Sales visit plan" do
    visit sales_visit_plans_url
    click_on "New Sales Visit Plan"

    fill_in "Category", with: @sales_visit_plan.category_id
    fill_in "Cluster", with: @sales_visit_plan.cluster
    fill_in "Deksripsi pekerjaan", with: @sales_visit_plan.deksripsi_pekerjaan
    fill_in "Estimasi tgl peretemuan", with: @sales_visit_plan.estimasi_tgl_peretemuan
    fill_in "Jenis pekerjaan", with: @sales_visit_plan.jenis_pekerjaan
    check "Minggu1" if @sales_visit_plan.minggu1
    check "Minggu2" if @sales_visit_plan.minggu2
    check "Minggu3" if @sales_visit_plan.minggu3
    check "Minggu4" if @sales_visit_plan.minggu4
    fill_in "Nama", with: @sales_visit_plan.nama
    fill_in "Nama entitas lokasi pengadaan", with: @sales_visit_plan.nama_entitas_lokasi_pengadaan
    click_on "Create Sales visit plan"

    assert_text "Sales visit plan was successfully created"
    click_on "Back"
  end

  test "updating a Sales visit plan" do
    visit sales_visit_plans_url
    click_on "Edit", match: :first

    fill_in "Category", with: @sales_visit_plan.category_id
    fill_in "Cluster", with: @sales_visit_plan.cluster
    fill_in "Deksripsi pekerjaan", with: @sales_visit_plan.deksripsi_pekerjaan
    fill_in "Estimasi tgl peretemuan", with: @sales_visit_plan.estimasi_tgl_peretemuan
    fill_in "Jenis pekerjaan", with: @sales_visit_plan.jenis_pekerjaan
    check "Minggu1" if @sales_visit_plan.minggu1
    check "Minggu2" if @sales_visit_plan.minggu2
    check "Minggu3" if @sales_visit_plan.minggu3
    check "Minggu4" if @sales_visit_plan.minggu4
    fill_in "Nama", with: @sales_visit_plan.nama
    fill_in "Nama entitas lokasi pengadaan", with: @sales_visit_plan.nama_entitas_lokasi_pengadaan
    click_on "Update Sales visit plan"

    assert_text "Sales visit plan was successfully updated"
    click_on "Back"
  end

  test "destroying a Sales visit plan" do
    visit sales_visit_plans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sales visit plan was successfully destroyed"
  end
end
