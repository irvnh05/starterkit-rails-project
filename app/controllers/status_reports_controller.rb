class StatusReportsController < ApplicationController
  before_action :set_status_report, only: [:show, :edit, :update, :destroy, :download]

  # GET /status_reports or /status_reports.json
  # def index
  #   @status_reports = StatusReport.all
  # end

  def download
    @status_report = StatusReport.find_by(id: params[:id])
    
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "status_report", 
        disable_smart_shrinking: true,
        layout:'pdf.html',
        template: 'status_reports/download',
        page_size: 'A4',
        orientation: 'Landscape',
        encoding:"UTF-8",
        show_as_html: params.key?('debug')
      end
    end
  end

  # GET /status_reports/1 or /status_reports/1.json
  def show
    @status_report = StatusReport.find_by(id: params[:id])
  end

  # GET /status_reports/new
  # def new
  #   @status_report = StatusReport.new
  # end

  # GET /status_reports/1/edit
  def edit
    status_reports = StatusReport.find(params[:id]) 
    @nama = status_reports.nama_personil.to_s.squish.split(',')
    @jabatan =  status_reports.jabatan_personil.to_s.squish.split(',')
    @kontak = status_reports.kontak_personil.to_s.split(',')
    @personil_yang_dikunjungi = [@nama,@jabatan,@kontak].transpose

    # contact = Contact.find_by(status_reports.realization_visit_plan.sales_visit_plan.data_company.contact_id) 
    # nama_pic = contact.nama_pic

  end

  # POST /status_reports or /status_reports.json
  # def create
    
  # end

  # PATCH/PUT /status_reports/1 or /status_reports/1.json
  def update
    status_reports = StatusReport.find(params[:id]) 
    nama_personil = []
    nama_personil = params[:status_report][:nama_personil]
    jabatan_personil = []
    jabatan_personil = params[:status_report][:jabatan_personil]
    kontak_personil = []
    kontak_personil = params[:status_report][:kontak_personil]

    respond_to do |format|
      if @status_report.update(status_report_params)
       
        status_reports.status_laporan = "1"
        status_reports.nama_personil = nama_personil
        status_reports.jabatan_personil = jabatan_personil
        status_reports.kontak_personil = kontak_personil
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

  def cetak_pdf
    @status_report = StatusReport.find_by(id: params[:id])
    
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "contacts", 
        disable_smart_shrinking: true,
        layout:'pdf.html',
        template: 'contacts/download',
        page_size: 'A4',
        orientation: 'Landscape',
        encoding:"UTF-8",
        show_as_html: params.key?('debug')
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_report
      @status_report = StatusReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def status_report_params
      params.require(:status_report).permit(
        :catatan,
        :hasil_kunjungan,
        :tindak_lanjut,
        :lokasi_kunjungan,
        :nama_personil,
        :jabatan_personil,
        :kontak_personil
      )
    end
end
