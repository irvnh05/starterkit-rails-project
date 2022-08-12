require 'test_helper'

class SalesVisitPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_visit_plan = sales_visit_plans(:one)
  end

  test "should get index" do
    get sales_visit_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_visit_plan_url
    assert_response :success
  end

  test "should create sales_visit_plan" do
    assert_difference('SalesVisitPlan.count') do
      post sales_visit_plans_url, params: { sales_visit_plan: { category_id: @sales_visit_plan.category_id, cluster: @sales_visit_plan.cluster, deksripsi_pekerjaan: @sales_visit_plan.deksripsi_pekerjaan, estimasi_tgl_peretemuan: @sales_visit_plan.estimasi_tgl_peretemuan, jenis_pekerjaan: @sales_visit_plan.jenis_pekerjaan, minggu1: @sales_visit_plan.minggu1, minggu2: @sales_visit_plan.minggu2, minggu3: @sales_visit_plan.minggu3, minggu4: @sales_visit_plan.minggu4, nama: @sales_visit_plan.nama, nama_entitas_lokasi_pengadaan: @sales_visit_plan.nama_entitas_lokasi_pengadaan } }
    end

    assert_redirected_to sales_visit_plan_url(SalesVisitPlan.last)
  end

  test "should show sales_visit_plan" do
    get sales_visit_plan_url(@sales_visit_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_visit_plan_url(@sales_visit_plan)
    assert_response :success
  end

  test "should update sales_visit_plan" do
    patch sales_visit_plan_url(@sales_visit_plan), params: { sales_visit_plan: { category_id: @sales_visit_plan.category_id, cluster: @sales_visit_plan.cluster, deksripsi_pekerjaan: @sales_visit_plan.deksripsi_pekerjaan, estimasi_tgl_peretemuan: @sales_visit_plan.estimasi_tgl_peretemuan, jenis_pekerjaan: @sales_visit_plan.jenis_pekerjaan, minggu1: @sales_visit_plan.minggu1, minggu2: @sales_visit_plan.minggu2, minggu3: @sales_visit_plan.minggu3, minggu4: @sales_visit_plan.minggu4, nama: @sales_visit_plan.nama, nama_entitas_lokasi_pengadaan: @sales_visit_plan.nama_entitas_lokasi_pengadaan } }
    assert_redirected_to sales_visit_plan_url(@sales_visit_plan)
  end

  test "should destroy sales_visit_plan" do
    assert_difference('SalesVisitPlan.count', -1) do
      delete sales_visit_plan_url(@sales_visit_plan)
    end

    assert_redirected_to sales_visit_plans_url
  end
end
