class HomeController < ApplicationController
  def index
    @realization_visit_plan = RealizationVisitPlan.all

    # @InternalSHGas = ProjectPotential.where(:cluster => "Eksternal (Pertamina Grup)").group(:nama_entitas).sum(:nominal)

  end
  
  def sales_plan_by_category
    result = Sporter.group(:age).count
    render json: [{name: 'Count', data: result}]
  end


end
