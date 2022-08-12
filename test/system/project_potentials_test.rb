require "application_system_test_case"

class ProjectPotentialsTest < ApplicationSystemTestCase
  setup do
    @project_potential = project_potentials(:one)
  end

  test "visiting the index" do
    visit project_potentials_url
    assert_selector "h1", text: "Project Potentials"
  end

  test "creating a Project potential" do
    visit project_potentials_url
    click_on "New Project Potential"

    fill_in "Cluster", with: @project_potential.cluster
    fill_in "Durasi proyek", with: @project_potential.durasi_proyek
    fill_in "Informasi tambahan", with: @project_potential.informasi_tambahan
    fill_in "Jadwal perkiraan tender", with: @project_potential.jadwal_perkiraan_tender
    fill_in "Judul tender", with: @project_potential.judul_tender
    fill_in "Konfirmasi", with: @project_potential.konfirmasi
    fill_in "Lini bisnis", with: @project_potential.lini_bisnis
    fill_in "Lokasi", with: @project_potential.lokasi
    fill_in "Nama entitas", with: @project_potential.nama_entitas
    fill_in "Nilai", with: @project_potential.nilai
    fill_in "Nominal", with: @project_potential.nominal
    fill_in "Remark", with: @project_potential.remark
    click_on "Create Project potential"

    assert_text "Project potential was successfully created"
    click_on "Back"
  end

  test "updating a Project potential" do
    visit project_potentials_url
    click_on "Edit", match: :first

    fill_in "Cluster", with: @project_potential.cluster
    fill_in "Durasi proyek", with: @project_potential.durasi_proyek
    fill_in "Informasi tambahan", with: @project_potential.informasi_tambahan
    fill_in "Jadwal perkiraan tender", with: @project_potential.jadwal_perkiraan_tender
    fill_in "Judul tender", with: @project_potential.judul_tender
    fill_in "Konfirmasi", with: @project_potential.konfirmasi
    fill_in "Lini bisnis", with: @project_potential.lini_bisnis
    fill_in "Lokasi", with: @project_potential.lokasi
    fill_in "Nama entitas", with: @project_potential.nama_entitas
    fill_in "Nilai", with: @project_potential.nilai
    fill_in "Nominal", with: @project_potential.nominal
    fill_in "Remark", with: @project_potential.remark
    click_on "Update Project potential"

    assert_text "Project potential was successfully updated"
    click_on "Back"
  end

  test "destroying a Project potential" do
    visit project_potentials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project potential was successfully destroyed"
  end
end
