class HomeController < ApplicationController
  def index
    @realization_visit_plan = RealizationVisitPlan.all
  end
  
  def sales_plan_by_category
    result = Sporter.group(:age).count
    render json: [{name: 'Count', data: result}]
  end
end
