class DataCompaniesController < ApplicationController
  before_action :set_data_company,  only: [:show, :edit, :update, :destroy ]

  # GET /data_companies or /data_companies.json
  def index
    # @data_companies = DataCompany.all
    # @data_category = @data_companies.each do |data_company|
    # @category = DataCompany.select(:category_id).map(&:category_id).uniq
    @category = Category.select(:name).map(&:name).uniq


    if current_user.roles.any? {|r| r.name == "Superadmin"}
      @data_companies = DataCompany.all.order("data_companies.created_at asc")
    elsif current_user.roles.any? {|r| r.name == "Sales"}
      @data_companies = DataCompany.all.order("data_companies.created_at asc")
    elsif current_user.roles.any? {|r| r.name == "GM Komersial"}
      @data_companies = DataCompany.all.order("data_companies.created_at asc")
    elsif current_user.roles.any? {|r| r.name == "Kepala Divisi Marketing"}
      @data_companies = DataCompany.all.order("data_companies.created_at asc")
    else
      @data_companies = DataCompany.where("email_user": current_user.role_assignments.each_with_index.map {|role_assignment| "#{role_assignment.role.try(:name)}"}.join(", ") ).order("data_companies.created_at asc")
    end
  end

  # GET /data_companies/1 or /data_companies/1.json
  def show
  end

  # GET /data_companies/new
  def new
    @data_company = DataCompany.new
  end

  # GET /data_companies/1/edit
  def edit
  end

  # POST /data_companies or /data_companies.json
  def create
    @data_company = DataCompany.new(data_company_params)
    @data_company.email_user = current_user.role_assignments.each_with_index.map {|role_assignment| "#{role_assignment.role.try(:name)}"}.join(", ") 
    respond_to do |format|
      if @data_company.save
        format.html { redirect_to data_companies_path, notice: "Data company was successfully created." }
        format.json { render :show, status: :created, location: @data_company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @data_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_companies/1 or /data_companies/1.json
  def update
    respond_to do |format|
      if @data_company.update(data_company_params)
        format.html { redirect_to @data_company, notice: "Data company was successfully updated." }
        format.json { render :show, status: :ok, location: @data_company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @data_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_companies/1 or /data_companies/1.json
  def destroy
    @data_company.destroy
    respond_to do |format|
      format.html { redirect_to data_companies_url, notice: "Data company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_company
      @data_company = DataCompany.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def data_company_params
      params.require(:data_company).permit(:category_id, :cluster, :nama_entitas, :area, :lokasi_kerja, :alamat, :website, :daftar_pekerjaan, :email_user, :keterangan, :create_by , :sales_visit_plan_id)
    end
end
