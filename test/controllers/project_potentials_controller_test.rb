require 'test_helper'

class ProjectPotentialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_potential = project_potentials(:one)
  end

  test "should get index" do
    get project_potentials_url
    assert_response :success
  end

  test "should get new" do
    get new_project_potential_url
    assert_response :success
  end

  test "should create project_potential" do
    assert_difference('ProjectPotential.count') do
      post project_potentials_url, params: { project_potential: { cluster: @project_potential.cluster, durasi_proyek: @project_potential.durasi_proyek, informasi_tambahan: @project_potential.informasi_tambahan, jadwal_perkiraan_tender: @project_potential.jadwal_perkiraan_tender, judul_tender: @project_potential.judul_tender, konfirmasi: @project_potential.konfirmasi, lini_bisnis: @project_potential.lini_bisnis, lokasi: @project_potential.lokasi, nama_entitas: @project_potential.nama_entitas, nilai: @project_potential.nilai, nominal: @project_potential.nominal, remark: @project_potential.remark } }
    end

    assert_redirected_to project_potential_url(ProjectPotential.last)
  end

  test "should show project_potential" do
    get project_potential_url(@project_potential)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_potential_url(@project_potential)
    assert_response :success
  end

  test "should update project_potential" do
    patch project_potential_url(@project_potential), params: { project_potential: { cluster: @project_potential.cluster, durasi_proyek: @project_potential.durasi_proyek, informasi_tambahan: @project_potential.informasi_tambahan, jadwal_perkiraan_tender: @project_potential.jadwal_perkiraan_tender, judul_tender: @project_potential.judul_tender, konfirmasi: @project_potential.konfirmasi, lini_bisnis: @project_potential.lini_bisnis, lokasi: @project_potential.lokasi, nama_entitas: @project_potential.nama_entitas, nilai: @project_potential.nilai, nominal: @project_potential.nominal, remark: @project_potential.remark } }
    assert_redirected_to project_potential_url(@project_potential)
  end

  test "should destroy project_potential" do
    assert_difference('ProjectPotential.count', -1) do
      delete project_potential_url(@project_potential)
    end

    assert_redirected_to project_potentials_url
  end
end
