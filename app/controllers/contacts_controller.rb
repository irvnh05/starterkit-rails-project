class ContactsController < ApplicationController
  before_action :set_contact,  only: [:show, :edit, :update, :destroy ]

  # GET /contacts or /contacts.json
  def index
    # @contacts = Contact.includes(:user).order(created_at: :asc)
    @category = Category.select(:name).map(&:name).uniq
    # @contacts = Contact.all

    if current_user.roles.any? {|r| r.name == "Superadmin"}
      @contacts = Contact.all.order("contacts.created_at asc")
    elsif current_user.roles.any? {|r| r.name == "Sales"}
      @contacts = Contact.all.order("contacts.created_at asc")
    elsif current_user.roles.any? {|r| r.name == "GM Komersial"}
      @contacts = Contact.all.order("contacts.created_at asc")
    elsif current_user.roles.any? {|r| r.name == "Kepala Divisi Marketing"}
      @contacts = Contact.all.order("contacts.created_at asc")
    else
      @contacts = Contact.where("email_user": current_user.role_assignments.each_with_index.map {|role_assignment| "#{role_assignment.role.try(:name)}"}.join(", ") ).order("contacts.created_at asc")
    end
  end

  def cetak_pdf
    @contacts = Contact.find_by(id: params[:id])
    
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "contacts", 
        disable_smart_shrinking: true,
        layout:'pdf_simple.html',
        template: 'contacts/download',
        page_size: 'A4',
        orientation: 'Landscape',
        encoding:"UTF-8",
        show_as_html: params.key?('debug')
      end
    end
  end

  # GET /contacts/1 or /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)
    @contact.email_user = current_user.role_assignments.each_with_index.map {|role_assignment| "#{role_assignment.role.try(:name)}"}.join(", ") 
    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_path, notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(
        :category_id, 
        :cluster, 
        :nama_entitas, 
        :satuan_kerja, 
        :lokasi_kerja, 
        :nama_pic, 
        :jabatan_pic, 
        :emaiil_pic, 
        :kontak_pic, 
        :keterangan,
        :work_unit_id,
        # :user_id
        :email_user,
        file_lampiran:[]
        )
    end
end
