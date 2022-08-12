class ProjectPotentialsController < ApplicationController
  before_action :set_project_potential, only: %i[ show edit update destroy ]

  # GET /project_potentials or /project_potentials.json
  def index
    @project_potentials = ProjectPotential.all
    @project_potential = ProjectPotential.new
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
        format.html { redirect_to project_potential_url(@project_potential), notice: "Project potential was successfully created." }
        format.json { render :show, status: :created, location: @project_potential }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_potential.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_potentials/1 or /project_potentials/1.json
  def update
    respond_to do |format|
      if @project_potential.update(project_potential_params)
        format.html { redirect_to project_potential_url(@project_potential), notice: "Project potential was successfully updated." }
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
      params.require(:project_potential).permit(:nama_entitas, :cluster, :lokasi, :judul_tender, :nilai, :nominal, :lini_bisnis, :jadwal_perkiraan_tender, :durasi_proyek, :remark, :konfirmasi, :informasi_tambahan)
    end
end
