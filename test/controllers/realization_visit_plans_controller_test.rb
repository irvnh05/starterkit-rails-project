require 'test_helper'

class RealizationVisitPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @realization_visit_plan = realization_visit_plans(:one)
  end

  test "should get index" do
    get realization_visit_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_realization_visit_plan_url
    assert_response :success
  end

  test "should create realization_visit_plan" do
    assert_difference('RealizationVisitPlan.count') do
      post realization_visit_plans_url, params: { realization_visit_plan: { category_id: @realization_visit_plan.category_id, cluster: @realization_visit_plan.cluster, nama_entitas_lokasi_pengadaan: @realization_visit_plan.nama_entitas_lokasi_pengadaan, realisasi: @realization_visit_plan.realisasi, realisasi_tgl_peretemuan: @realization_visit_plan.realisasi_tgl_peretemuan, subjek_deksripsi_pekerjaan: @realization_visit_plan.subjek_deksripsi_pekerjaan } }
    end

    assert_redirected_to realization_visit_plan_url(RealizationVisitPlan.last)
  end

  test "should show realization_visit_plan" do
    get realization_visit_plan_url(@realization_visit_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_realization_visit_plan_url(@realization_visit_plan)
    assert_response :success
  end

  test "should update realization_visit_plan" do
    patch realization_visit_plan_url(@realization_visit_plan), params: { realization_visit_plan: { category_id: @realization_visit_plan.category_id, cluster: @realization_visit_plan.cluster, nama_entitas_lokasi_pengadaan: @realization_visit_plan.nama_entitas_lokasi_pengadaan, realisasi: @realization_visit_plan.realisasi, realisasi_tgl_peretemuan: @realization_visit_plan.realisasi_tgl_peretemuan, subjek_deksripsi_pekerjaan: @realization_visit_plan.subjek_deksripsi_pekerjaan } }
    assert_redirected_to realization_visit_plan_url(@realization_visit_plan)
  end

  test "should destroy realization_visit_plan" do
    assert_difference('RealizationVisitPlan.count', -1) do
      delete realization_visit_plan_url(@realization_visit_plan)
    end

    assert_redirected_to realization_visit_plans_url
  end
end
