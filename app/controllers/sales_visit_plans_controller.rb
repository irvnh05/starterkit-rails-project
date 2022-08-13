class SalesVisitPlansController < ApplicationController
  before_action :set_sales_visit_plan, only: %i[ show edit update destroy ]

  def realisasi
    @realization_visit_plan = RealizationVisitPlan.new
    @realisasi = RealizationVisitPlan.where(sales_id: params[:id])
  end

  # GET /sales_visit_plans or /sales_visit_plans.json
  def index
    @sales_visit_plans = SalesVisitPlan.all
    @realization_visit_plans = RealizationVisitPlan.all
  end

  # GET /sales_visit_plans/1 or /sales_visit_plans/1.json
  def show
  end

  # GET /sales_visit_plans/new
  def new
    @sales_visit_plan = SalesVisitPlan.new
  end

  # GET /sales_visit_plans/1/edit
  def edit
  end

  # POST /sales_visit_plans or /sales_visit_plans.json
  def create
    @sales_visit_plan = SalesVisitPlan.new(sales_visit_plan_params)    # if      
   
    if params[:pilihan].eql? "Minggu 1"
      @sales_visit_plan.minggu1 = "Minggu 1"
    elsif params[:pilihan].eql?  "Minggu 2"
      @sales_visit_plan.minggu2 = "Minggu 2"
    elsif params[:pilihan].eql?  "Minggu 3"
      @sales_visit_plan.minggu3 = "Minggu 3"
    else
      @sales_visit_plan.minggu4 = "Minggu 4"
    end

    respond_to do |format|
      @sales_visit_plan.email_user = current_user.role_assignments.each_with_index.map {|role_assignment| "#{role_assignment.role.try(:name)}"}.join(", ") 
      if @sales_visit_plan.save
        # new_realization_visit_plan_path
        # format.html { redirect_to realisasi_activity_sale_path(@sales_visit_plan.id), notice: "Sales visit plan was successfully created." }
        format.html { redirect_to activity_sales_path, notice: "Sales visit plan was successfully created." }
        format.json { render :show, status: :created, location: @sales_visit_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sales_visit_plan.errors, status: :unprocessable_entity }
      end
    end
    # s
  end

  # PATCH/PUT /sales_visit_plans/1 or /sales_visit_plans/1.json
  def update
    respond_to do |format|
      if @sales_visit_plan.update(sales_visit_plan_params)
        format.html { redirect_to activity_sales_path, notice: "Sales visit plan was successfully updated." }
        format.json { render :show, status: :ok, location: @sales_visit_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sales_visit_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_visit_plans/1 or /sales_visit_plans/1.json
  def destroy
    @sales_visit_plan.destroy
    respond_to do |format|
      format.html { redirect_to activity_sales_path, notice: "Sales visit plan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_visit_plan
      # @sales_visit_plan = SalesVisitPlan.find(params[:id])      
        @sales_visit_plan = SalesVisitPlan.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sales_visit_plan_params
      params.require(:sales_visit_plan).permit(
        :nama_entitas_lokasi_pengadaan, 
        :jenis_pekerjaan, 
        :deksripsi_pekerjaan, 
        :cluster, 
        :estimasi_tgl_peretemuan, 
        :nama, 
        # :minggu1, 
        # :minggu2, 
        # :minggu3, 
        # :minggu4, 
        :minggu_kunjungan,
        :category_id,
        file_lampiran: [],
        )
    end
end
