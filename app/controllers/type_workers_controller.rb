class TypeWorkersController < ApplicationController
  before_action :set_type_worker, only: [:show, :edit, :update, :destroy]

  # GET /type_workers
  # GET /type_workers.json
  def index
    @type_workers = TypeWorker.all
  end

  # GET /type_workers/1
  # GET /type_workers/1.json
  def show
  end

  # GET /type_workers/new
  def new
    @type_worker = TypeWorker.new
  end

  # GET /type_workers/1/edit
  def edit
  end

  # POST /type_workers
  # POST /type_workers.json
  def create
    @type_worker = TypeWorker.new(type_worker_params)

    respond_to do |format|
      if @type_worker.save
        format.html { redirect_to master_index_path(pilihan: "Data Jenis Pekerjaan"), notice: 'Type worker was successfully created.' }
        format.json { render :show, status: :created, location: @type_worker }
      else
        format.html { render :new }
        format.json { render json: @type_worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_workers/1
  # PATCH/PUT /type_workers/1.json
  def update
    respond_to do |format|
      if @type_worker.update(type_worker_params)
        format.html { redirect_to master_index_path(pilihan: "Data Jenis Pekerjaan"), notice: 'Type worker was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_worker }
      else
        format.html { render :edit }
        format.json { render json: @type_worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_workers/1
  # DELETE /type_workers/1.json
  def destroy
    @type_worker.destroy
    respond_to do |format|
      format.html { redirect_to master_index_path(pilihan: "Data Jenis Pekerjaan"), notice: 'Type worker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_worker
      @type_worker = TypeWorker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_worker_params
      params.require(:type_worker).permit(:name)
    end
end
