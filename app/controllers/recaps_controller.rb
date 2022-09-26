class RecapsController < ApplicationController

  def index
    @sales_visit_plans = SalesVisitPlan.all
    @realization_visit_plans = RealizationVisitPlan.all
    @category = Category.select(:name).map(&:name).uniq
    @cluster_realisasi = RealizationVisitPlan.select(:cluster).map(&:cluster).uniq
    @cluster_plan = SalesVisitPlan.select(:cluster).map(&:cluster).uniq
  end

  def show_reallisasi
    @realization_visit_plan = RealizationVisitPlan.find(params[:id])
  end

  def show_rencana
    @sales_visit_plan = SalesVisitPlan.find(params[:id])
  end

end
