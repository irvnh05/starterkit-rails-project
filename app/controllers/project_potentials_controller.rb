class ProjectPotentialsController < ApplicationController
  before_action :set_project_potential, only: [:show, :edit, :update, :destroy]

  # GET /project_potentials or /project_potentials.json
  def index
    @project_potentials = ProjectPotential.all
    @project_potential = ProjectPotential.new

    # filter
    @konfirmasi = @project_potentials.select(:konfirmasi).map(&:konfirmasi).uniq
    @perusahaan = @project_potentials.select(:nama_entitas).map(&:nama_entitas).uniq
    @status = @project_potentials.select(:remark).map(&:remark).uniq
    
    #
    # @cek_non_sinergi= @project_potentials.where("remark": "NON SINERGI").uniq(&:nama_entitas).count

    # total all
    @total_jumlah_proyek  =  ProjectPotential.distinct(:nama_entitas).count
    #total non
    
    # Person.group(:age).having('count(*) > 1').order('age desc').count
    # @total_jumlah_proyek_non  =  @project_potentials.where("remark": "NON SINERGI").uniq(&:nama_entitas)

    @cek_non_sinergi = @project_potentials.where("remark": "NON SINERGI").group(:nama_entitas).count
    # @cek_non_sinergi_nilai = @project_potentials.where("remark": "NON SINERGI").group(:nama_entitas).pluck(:nilai)
    # if cek = @project_potentials.where("remark": "NON SINERGI")

    # else

    # end
    # (:conditions  =>  " umur > 26 DAN job.salary > 60000 ")
    # (:nama_entitas)
    # @total_nilai_proyek =

  end

  # GET /project_potentials/1 or /project_potentials/1.json
  def show
  end

  # GET /project_potentials/new
  def new
    @project_potential = ProjectPotential.new
  end

  # GET /project_potentials/1/edit
  def edit
  end

  # POST /project_potentials or /project_potentials.json
  def create
    @project_potential = ProjectPotential.new(project_potential_params)

    respond_to do |format|
      if @project_potential.save
        format.html { redirect_to project_potentials_path, notice: "Project potential was successfully created." }
        format.json { render :show, status: :created, location: @project_potential }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_potential.errors, status: :unprocessable_entity }
      end
    end
    # s
  end

  # PATCH/PUT /project_potentials/1 or /project_potentials/1.json
  def update
    respond_to do |format|
      if @project_potential.update(project_potential_params)
        format.html { redirect_to project_potentials_path, notice: "Project potential was successfully updated." }
        format.json { render :show, status: :ok, location: @project_potential }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project_potential.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_potentials/1 or /project_potentials/1.json
  def destroy
    @project_potential.destroy

    respond_to do |format|
      format.html { redirect_to project_potentials_url, notice: "Project potential was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_potential
      @project_potential = ProjectPotential.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_potential_params
      params.require(:project_potential).permit(
        :nama_entitas, 
        :cluster, 
        :lokasi, 
        :judul_tender, 
        :nilai, 
        :nominal, 
        :lini_bisnis, 
        :jadwal_perkiraan_tender, 
        :durasi_proyek, 
        :remark, 
        :konfirmasi, 
        :realization_visit_plan_id, 
        :informasi_tambahan
      )
    end
end
