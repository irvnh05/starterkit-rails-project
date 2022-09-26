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

    def number_to_currency_br(number)
      number_to_currency(number, :unit => "IDR ", :separator => ",", :delimiter => ".")
    end
 

    def get_month_name(num)
      case num
      when 1, "1"
        return "Januari"
      when 2, "2"
        return "Februari"
      when 3, "3"
        return "Maret"
      when 4, "4"
        return "April"
      when 5, "5"
        return "Mei"
      when 6, "6"
        return "Juni"
      when 7, "7"
        return "Juli"
      when 8, "8"
        return "Agustus"
      when 9, "9"
        return "September"
      when 10, "10"
        return "Oktober"
      when 11, "11"
        return "November"
      when 12, "12"
        return "Desember"
      else
        return ""
      end
    end


    def convert_currency(usd)
      # require 'net/http'
      # require 'json'

      # # Setting URL
      # url = "https://v6.exchangerate-api.com/v6/f8058921ca695c99ea78c449/latest/USD"
      # uri = URI(url)
      # response = Net::HTTP.get(uri)
      # response_obj = JSON.parse(response)

      # # Getting a rate
      # rate = response_obj['conversion_rates']['IDR']

      require 'nokogiri'
      require 'open-uri'
      url = 'https://www.bi.go.id/biwebservice/wskursbi.asmx/getSubKursLokal3?mts=USD&startdate=2022-09-26&enddate=2022-09-26'

      uri = URI(url)
      response = Net::HTTP.get(uri)

      doc = Nokogiri::HTML(response)
      doc.css('jual_subkurslokal').to_s.gsub('<','').gsub('>','').gsub('/','').gsub('jual_subkurslokal','').to_i * usd

     

						
    end