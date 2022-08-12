class ActivitySalesController < ApplicationController
  before_action :set_data_status_laporan,  only: [:status_laporan_destroy ]
  # GET /activity_sales or /activity_sales.json
  def index
    @sales_visit_plans = SalesVisitPlan.all
    @realization_visit_plans = RealizationVisitPlan.all
    @category = Category.select(:name).map(&:name).uniq
    @cluster_realisasi = RealizationVisitPlan.select(:cluster).map(&:cluster).uniq
    @cluster_plan = SalesVisitPlan.select(:cluster).map(&:cluster).uniq
  
    # @month = RealizationVisitPlan.select(:realisasi_tgl_peretemuan).map(&:realisasi_tgl_peretemuan)
    # @realization_visit_plans = RealizationVisitPlan.filter_by(filtering_params).page(params[:page])
    # if params[:year].present? or params[:month].present?
    #   @realization_visit_plans = RealizationVisitPlan.where("colum realisasi_tgl_peretemuan ? AND ?", ...)
    #   # @realization_visit_plans = your_own_query_for_filter 
    #  else
    #    @realization_visit_plans = RealizationVisitPlan.all
    #  end
  end

  def new
    @sales_visit_plan = SalesVisitPlan.new
    @realization_visit_plan = RealizationVisitPlan.new
  end


  def rekap
    @sales_visit_plans = SalesVisitPlan.all
    @realization_visit_plans = RealizationVisitPlan.all
    @category = Category.select(:name).map(&:name).uniq
    @cluster_realisasi = RealizationVisitPlan.select(:cluster).map(&:cluster).uniq
    @cluster_plan = SalesVisitPlan.select(:cluster).map(&:cluster).uniq
  end

  def status_laporan
    @status_laporan = StatusReport.all
  end

  def status_laporan_destroy
    @status_laporan.destroy
    respond_to do |format|
      format.html { redirect_to status_laporan_activity_sales_path, notice: "Status Laporan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_data_status_laporan
    @status_laporan = StatusReport.find(params[:id])
  end
end
