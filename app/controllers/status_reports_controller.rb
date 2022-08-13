class StatusReportsController < ApplicationController
  before_action :set_status_report, only: [:show, :edit, :update, :destroy]

  # GET /status_reports or /status_reports.json
  # def index
  #   @status_reports = StatusReport.all
  # end

  # GET /status_reports/1 or /status_reports/1.json
  def show
  end

  # GET /status_reports/new
  # def new
  #   @status_report = StatusReport.new
  # end

  # GET /status_reports/1/edit
  def edit
  end

  # POST /status_reports or /status_reports.json
  # def create
    
  # end

  # PATCH/PUT /status_reports/1 or /status_reports/1.json
  def update
    status_reports = StatusReport.find(params[:id]) 
    respond_to do |format|
      if @status_report.update(status_report_params)
        status_reports.status_laporan = "1"
        status_reports.tgl_direview = Time.new
        status_reports.save!
        format.html { redirect_to status_reports_path, notice: "Status Report was successfully updated." }
        format.json { render :show, status: :ok, location: status_reports_path }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: status_reports_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_reports/1 or /status_reports/1.json
  def destroy
    @status_report.destroy
    respond_to do |format|
      format.html { redirect_to status_reports_url, notice: "Status Report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_report
      @status_report = StatusReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def status_report_params
      params.require(:status_report).permit(:catatan)
    end
end
