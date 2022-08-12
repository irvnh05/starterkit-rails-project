module ApplicationHelper
   
    def getSalesPlan()
        @status_ticket = SalesVisitPlan.select('nama_entitas_lokasi_pengadaan,jenis_pekerjaan').order(:nama_entitas_lokasi_pengadaan => :asc)
        option = '<option value=""></value>'
        f = {}
            
        @status_ticket.each do |status_ticket|
        f["#{status_ticket.nama_entitas_lokasi_pengadaan} | #{status_ticket.jenis_pekerjaan}"] = "#{status_ticket.nama_entitas_lokasi_pengadaan} | #{status_ticket.jenis_pekerjaan}"
        end 
        f.sort_by { |key| key }
        f.each do |k,v|
        option = option + '<option value="'+k+'">'+v+'</option>'
        end
        
        return option
      end

end
