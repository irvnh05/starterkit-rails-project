require "application_system_test_case"

class RealizationVisitPlansTest < ApplicationSystemTestCase
  setup do
    @realization_visit_plan = realization_visit_plans(:one)
  end

  test "visiting the index" do
    visit realization_visit_plans_url
    assert_selector "h1", text: "Realization Visit Plans"
  end

  test "creating a Realization visit plan" do
    visit realization_visit_plans_url
    click_on "New Realization Visit Plan"

    fill_in "Category", with: @realization_visit_plan.category_id
    fill_in "Cluster", with: @realization_visit_plan.cluster
    fill_in "Nama entitas lokasi pengadaan", with: @realization_visit_plan.nama_entitas_lokasi_pengadaan
    fill_in "Realisasi", with: @realization_visit_plan.realisasi
    fill_in "Realisasi tgl peretemuan", with: @realization_visit_plan.realisasi_tgl_peretemuan
    fill_in "Subjek deksripsi pekerjaan", with: @realization_visit_plan.subjek_deksripsi_pekerjaan
    click_on "Create Realization visit plan"

    assert_text "Realization visit plan was successfully created"
    click_on "Back"
  end

  test "updating a Realization visit plan" do
    visit realization_visit_plans_url
    click_on "Edit", match: :first

    fill_in "Category", with: @realization_visit_plan.category_id
    fill_in "Cluster", with: @realization_visit_plan.cluster
    fill_in "Nama entitas lokasi pengadaan", with: @realization_visit_plan.nama_entitas_lokasi_pengadaan
    fill_in "Realisasi", with: @realization_visit_plan.realisasi
    fill_in "Realisasi tgl peretemuan", with: @realization_visit_plan.realisasi_tgl_peretemuan
    fill_in "Subjek deksripsi pekerjaan", with: @realization_visit_plan.subjek_deksripsi_pekerjaan
    click_on "Update Realization visit plan"

    assert_text "Realization visit plan was successfully updated"
    click_on "Back"
  end

  test "destroying a Realization visit plan" do
    visit realization_visit_plans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Realization visit plan was successfully destroyed"
  end
end
