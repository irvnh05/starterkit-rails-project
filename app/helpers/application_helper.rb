module ApplicationHelper
   
    def getSalesPlan()
        @status_ticket = SalesVisitPlan.select('id','nama_entitas_lokasi_pengadaan,category_id,deksripsi_pekerjaan,cluster,minggu1,minggu2,minggu3,minggu4,jenis_pekerjaan').order(:nama_entitas_lokasi_pengadaan => :asc)
        # @sales_visit_plans =  SalesVisitPlan.find_by(email_user: current_user.role_assignments.each_with_index.map {|role_assignment| "#{role_assignment.role.try(:name)}"}.join(", ") )

        
        # record.your_attachment.joins(:blob).where('active_storage_blobs.metadata LIKE ?', '%"your_attribute":"your_value"%')

        option = '<option value=""></value>'
        f = {}
        # @lampiran = SalesVisitPlan.new     
        @status_ticket.each do |status_ticket|
        #realisasi
        @realisasi = 
          if status_ticket.minggu1.present? 
              "Minggu 1"
            elsif status_ticket.minggu2.present? 
              "Minggu 2"
            elsif status_ticket.minggu3.present? 
              "Minggu 3"
            else
              "Minggu 4"
          end
          
        # @lampiran = status_ticket.file_lampiran
        # lampiran @sales_visit_plans.each_with_index do |sales_visit_plan, index| 
        # | #{status_ticket.id}
        f["#{status_ticket.nama_entitas_lokasi_pengadaan} | #{status_ticket.category_id} | #{status_ticket.deksripsi_pekerjaan} | #{status_ticket.cluster} | #{@realisasi} | #{status_ticket.id} "] = "#{status_ticket.nama_entitas_lokasi_pengadaan} | #{status_ticket.category.name} | #{status_ticket.deksripsi_pekerjaan} | #{status_ticket.cluster} | #{@realisasi}"
        end 
        f.sort_by { |key| key }
        f.each do |k,v|
       
          selected = "selected"
            
          option = option + '<option value="'+k+'" '+selected.to_s+'>'+v+'</option>'
      end 
      return option  
    end
    end
    

    public def getSalesPlanById(parameter)  
      if parameter.present?
         @status_ticket = SalesVisitPlan.select('id','nama_entitas_lokasi_pengadaan,category_id,deksripsi_pekerjaan,cluster,minggu1,minggu2,minggu3,minggu4,jenis_pekerjaan').order(:nama_entitas_lokasi_pengadaan => :asc)
         option = '<option value=""></value>'
         f = {}
         @status_ticket.each do |status_ticket|
            #realisasi
          @realisasi = 
          if status_ticket.minggu1.present? 
              "Minggu 1"
            elsif status_ticket.minggu2.present? 
              "Minggu 2"
            elsif status_ticket.minggu3.present? 
              "Minggu 3"
            else
              "Minggu 4"
          end

        #  @lampiran = 
        #  status_ticket.file_lampiran.each do |lampiran| 
        #     lampiran.filename
        #  end
  
         f["#{status_ticket.nama_entitas_lokasi_pengadaan} | #{status_ticket.category_id} | #{status_ticket.deksripsi_pekerjaan} | #{status_ticket.cluster} | #{@realisasi} | #{status_ticket.id} "] = "#{status_ticket.nama_entitas_lokasi_pengadaan} | #{status_ticket.category.name} | #{status_ticket.deksripsi_pekerjaan} | #{status_ticket.cluster} | #{@realisasi}"
         end 
         f.sort_by { |key| key } 
         f.each do |k,v|
           
           if v.to_s.split('|')[0].strip.eql? parameter
             selected = "selected"
           end
           option = option + '<option value="'+k+'" '+selected.to_s+'>'+v.to_s.split('|')[0].strip+'</option>'
         end
       return option  
    end
    end
