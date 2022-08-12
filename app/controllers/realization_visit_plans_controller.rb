class RealizationVisitPlansController < ApplicationController
  before_action :set_realization_visit_plan, only: %i[ show edit update destroy ]

  # GET /realization_visit_plans or /realization_visit_plans.json
  def index
    @realization_visit_plans = RealizationVisitPlan.all
    # @realization_visit_plans = RealizationVisitPlan.fi
    lter_by(filtering_params).page(params[:page])
    # @realization_visit_plans = RealizationVisitPlan.filter_by(search_params).page(params[:page])
  end

  # GET /realization_visit_plans/1 or /realization_visit_plans/1.json
  def show
  end

  # GET /realization_visit_plans/new
  
  def new
    # @realization_visit_plan = RealizationVisitPlan.new
    @sales_visit_plans =  SalesVisitPlan.find_by(email_user: current_user.role_assignments.each_with_index.map {|role_assignment| "#{role_assignment.role.try(:name)}"}.join(", ") )

    if @sales_visit_plans.present?
      @realization_visit_plan = RealizationVisitPlan.new
    else
      redirect_to activity_sales_path
    end
  end

  # GET /realization_visit_plans/1/edit
  def edit
  end

  # POST /realization_visit_plans or /realization_visit_plans.json
  def create
    @realization_visit_plan = RealizationVisitPlan.new(realization_visit_plan_params)

    # @status_laporan = StatusReport.new()
      # @status_laporan = StatusReport.new
      # status_laporan.realization_visit_plan_id = @realization_visit_plan.id
      # status_laporan.tgl_aktivitas = @realization_visit_plan.realisasi_tgl_peretemuan
      # status_laporan.user_id = getUserId
      # status_laporan.is_approved = true
      # status_laporan.desc = params[:desc]
    # @status_laporan.realization_visit_plan_id =  @realization_visit_plan.id
    # @status_laporan.save
    # @status_laporan.realization_visit_plan_id = @realization_visit_plan.id

    respond_to do |format|
      # @realization_visit_plan.sales_id = params[:sales_id]
      # @status_laporan.realization_visit_plan_id =  @realization_visit_plan.id
      @realization_visit_plan.email_user = current_user.role_assignments.each_with_index.map {|role_assignment| "#{role_assignment.role.try(:name)}"}.join(", ") 
      if @realization_visit_plan.save
        status_laporan = StatusReport.new
        # status_laporan.nama_entitas_lokasi_pengadaan = @nama_entitas_lokasi_pengadaan.nama_entitas_lokasi_pengadaan
        status_laporan.realization_visit_plan_id = @realization_visit_plan.id
        status_laporan.tgl_aktivitas = @realization_visit_plan.realisasi_tgl_peretemuan
        status_laporan.save
        format.html { redirect_to activity_sales_path, notice: "Realization visit plan was successfully created." }
        format.json { render :show, status: :created, location: @realization_visit_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @realization_visit_plan.errors, status: :unprocessable_entity }
        # s
      end
    end
  end

  # PATCH/PUT /realization_visit_plans/1 or /realization_visit_plans/1.json
  def update
    respond_to do |format|
      if @realization_visit_plan.update(realization_visit_plan_params)
        format.html { redirect_to activity_sales_path, notice: "Realization visit plan was successfully updated." }
        format.json { render :show, status: :ok, location: @realization_visit_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @realization_visit_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /realization_visit_plans/1 or /realization_visit_plans/1.json
  def destroy
    @realization_visit_plan.destroy
    respond_to do |format|
      format.html { redirect_to activity_sales_path, notice: "Realization visit plan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_realization_visit_plan
      # @realization_visit_plan = RealizationVisitPlan.find_by(id: params[:id])
      @realization_visit_plan = RealizationVisitPlan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def realization_visit_plan_params
      params.require(:realization_visit_plan).permit(:email_user, :sales_id, :nama_entitas_lokasi_pengadaan, :subjek_deksripsi_pekerjaan, :cluster, :realisasi, :realisasi_tgl_peretemuan, :category_id)
    end

    def id_params
      params.permit(:id)
    end
    # def search_params
    #   params.slice(:category, :realisasi_tgl_peretemuan, :cluster)
    # end


  # def filtering_params
  #   params.slice(*RealizationVisitPlan.filter_scopes)
  # end
end
