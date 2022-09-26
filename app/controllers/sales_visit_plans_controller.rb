class SalesVisitPlansController < ApplicationController
  before_action :set_sales_visit_plan, only: %i[ show edit update destroy review review_update_rekap]

  def realisasi
    @realization_visit_plan = RealizationVisitPlan.new
    @realisasi = RealizationVisitPlan.where(sales_id: params[:id])
  end

  # GET /sales_visit_plans or /sales_visit_plans.json
  def index
    @sales_visit_plan = SalesVisitPlan.find_by(id: params[:id])

    @sales_visit_plans = SalesVisitPlan.all
    @realization_visit_plans = RealizationVisitPlan.all
  end

  # GET /sales_visit_plans/1 or /sales_visit_plans/1.json
  def show
  end

  # GET /sales_visit_plans/new
  def new
    @sales_visit_plan = SalesVisitPlan.new
    # @sales_visit_plans = SalesVisitPlan.find_by(id: params[:id])
    @sales_visit_plans = SalesVisitPlan.find_by("id": params[:id]) 
  end

  # GET /sales_visit_plans/1/edit
  def edit
    @sales_visit_plans = SalesVisitPlan.find_by("id": params[:id]) 

    @cek =
    if  @sales_visit_plans.minggu1.eql? "Minggu 1"
      @sales_visit_plans.minggu1 = "Minggu 1"
    elsif  @sales_visit_plans.minggu2.eql?  "Minggu 2"
      @sales_visit_plans.minggu2 = "Minggu 2"
    elsif  @sales_visit_plans.minggu3.eql?  "Minggu 3"
      @sales_visit_plans.minggu3 = "Minggu 3"
    else
      @sales_visit_plans.minggu4 = "Minggu 4"
    end
    @cek_minggu = [@cek]
  end

  # GET /sales_visit_plans/1/review
  def review
    @sales_visit_plans = SalesVisitPlan.find_by("id": params[:id]) 

    @cek =
    if  @sales_visit_plans.minggu1.eql? "Minggu 1"
      @sales_visit_plans.minggu1 = "Minggu 1"
    elsif  @sales_visit_plans.minggu2.eql?  "Minggu 2"
      @sales_visit_plans.minggu2 = "Minggu 2"
    elsif  @sales_visit_plans.minggu3.eql?  "Minggu 3"
      @sales_visit_plans.minggu3 = "Minggu 3"
    else
      @sales_visit_plans.minggu4 = "Minggu 4"
    end
    @cek_minggu = [@cek]
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
    # data_company = DataCompany.new
    # data_company.create_by = current_user.role_assignments.each_with_index.map {|role_assignment| "#{role_assignment.role.try(:name)}"}.join(", ") 
    # # data_company.id = 
    # data_company.save
    # if params[:data_company_id].present?
      # data_company = DataCompany.new
      # data_company.nama_entitas = @sales_visit_plan.nama_entitas_lokasi_pengadaan
      # # data_company.id = 
      # data_company.save
    # end    

    respond_to do |format|

      # data_company = DataCompany.create
      # # data_company.id =   @sales_visit_plan.id
      # data_company.create_by = current_user.role_assignments.each_with_index.map {|role_assignment| "#{role_assignment.role.try(:name)}"}.join(", ") 
      # # data_company.id =  
      
      # data_company.save

      @contact = params[:sales_visit_plan][:contact_id]
      @data_company = params[:sales_visit_plan][:data_company_id]
      @sales_visit_plan.roles_id = current_user.role_assignments.each_with_index.map {|role_assignment| "#{role_assignment.role.try(:id)}"}.join(", ") 
      @sales_visit_plan.email_user = current_user.role_assignments.each_with_index.map {|role_assignment| "#{role_assignment.role.try(:name)}"}.join(", ") 
      @sales_visit_plan.status = 0
      if @sales_visit_plan.save

         if @data_company.blank?
          data_company = DataCompany.new
          # data_company.sales_visit_plan_id = @sales_visit_plan.id
          data_company.create_by = current_user.role_assignments.each_with_index.map {|role_assignment| "#{role_assignment.role.try(:name)}"}.join(", ") 
          data_company.nama_entitas = @sales_visit_plan.nama_entitas_lokasi_pengadaan
          data_company.save!
          @sales_visit_plan.data_company_id = data_company.id
          @sales_visit_plan.save
         end

         if @data_company.blank?
          contact = Contact.new
          # contact.sales_visit_plan_id = @sales_visit_plan.id
          contact.create_by = current_user.role_assignments.each_with_index.map {|role_assignment| "#{role_assignment.role.try(:name)}"}.join(", ") 
          contact.nama_entitas = @sales_visit_plan.nama_entitas_lokasi_pengadaan
          contact.save!
          @sales_visit_plan.contact_id = contact.id
          @sales_visit_plan.save
         end
         
        #  recap_sales = RecapSale.new
        #  recap_sales.sales_visit_plan_id = @sales_visit_plan.id
        #  recap_sales.save

          # data_company = Contact.new
          # data_company.sales_visit_plan_id = @sales_visit_plan.id
          # data_company.create_by = current_user.role_assignments.each_with_index.map {|role_assignment| "#{role_assignment.role.try(:name)}"}.join(", ") 
          # data_company.save!
        #  end
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
    # @update = SalesVisitPlan.find_by(id: params[:id])
    # @catatan =  params[:sales_visit_plan][:catatan]
    respond_to do |format|
      # sales_visit_plan = SalesVisitPlan.find(params[:id]) 
      if  @sales_visit_plan.update(sales_visit_plan_params) 
        format.html { redirect_to activity_sales_path, notice: "Sales visit plan was successfully updated." }
        format.json { render :show, status: :ok, location: @sales_visit_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sales_visit_plan.errors, status: :unprocessable_entity }
      end
      # s
    end
  end

  def review_update_rekap
    # @update = SalesVisitPlan.find_by(id: params[:id])

    respond_to do |format|
      # @catatan =  params[:sales_visit_plan][:catatan]
      sales_visit_plan = SalesVisitPlan.find(params[:id]) 
      if  @sales_visit_plan.update(params_rekap) 
        sales_visit_plan.status = "1"
        sales_visit_plan.tgl_direview = Time.new
        sales_visit_plan.save!
        format.html { redirect_to recaps_path, notice: "Sales visit plan was successfully updated." }
        format.json { render :show, status: :ok, location: @sales_visit_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sales_visit_plan.errors, status: :unprocessable_entity }
      end
      # s
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


  def delete_file_lampiran
    @attachment = ActiveStorage::Attachment.find(params[:attachment_id])
    @attachment.purge # or use purge_later
    redirect_back(fallback_location: request.referer)
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
        :minggu1, 
        :minggu2, 
        :minggu3, 
        :minggu4, 
        :minggu_kunjungan,
        :category_id,
        :data_company_id,
        :status,
        :review_by,
        :catatan,
        :tgl_direview,
        # :roles_id,
        file_lampiran: [],
        )
    end

    def params_rekap
      params.require(:sales_visit_plan).permit(
        # :status,
        # :review_by,
        :catatan,
        # :tgl_direview,
      )
    end
end
