class HelperJsonController < ApplicationController

    def getDataCompanyCategory
        id = params[:id]
        render json: DataCompany.select('*')
          .where('id = ?', id)
          .map{ |vendor|
              vendor.category_id
        }
    end

    def getDataCompanyCluster
        id = params[:id]
        render json: DataCompany.select('*')
          .where('id = ?', id)
          .map{ |vendor|
              vendor.cluster
        }
    end

    def getDataContact
        # id = params[:id]
        # render json: DataCompany.select('*')
        #                 .where('nama_entitas = ?', id)
        #                 .map{ |vendor|
        #                     { 
        #                         :id => vendor.id,
        #                         :cluster => vendor.cluster, 
        #                         :category_id => vendor.category_id, 
        #                     }
        #                 }
        id = params[:id]
        render json: Contact.select('*')
          .where('nama_entitas = ?', id)
          .map{ |vendor|
              vendor.id
      }
    end

    def getDataCompany
        # id = params[:id]
        # render json: DataCompany.select('*')
        #                 .where('nama_entitas = ?', id)
        #                 .map{ |vendor|
        #                     { 
        #                         :id => vendor.id,
        #                         :cluster => vendor.cluster, 
        #                         :category_id => vendor.category_id, 
        #                     }
        #                 }
        id = params[:id]
        render json: DataCompany.select('*')
          .where('nama_entitas = ?', id)
          .map{ |vendor|
              vendor.id
      }
    end

    def getDataRealisasi
        id = params[:id]
        render json: RealizationVisitPlan.select('*')
          .where('nama_entitas_lokasi_pengadaan = ?', id)
          .map{ |vendor|
              vendor.id
      }
    end



    def getDataContactCategory
        id = params[:id]
        render json: Contact.select('*')
          .where('id = ?', id)
          .map{ |vendor|
              vendor.category_id
        }
    end

    def getDataContactCluster
        id = params[:id]
        render json: Contact.select('*')
          .where('id = ?', id)
          .map{ |vendor|
              vendor.cluster
        }
    end

    def getDataContactLokasiKerja
        id = params[:id]
        render json: Contact.select('*')
          .where('id = ?', id)
          .map{ |vendor|
              vendor.lokasi_kerja
        }
    end

    def getDataUploadSales
        id = params[:id]
        render json: SalesVisitPlan.select('*')
          .where('id = ?', id)
          .map{ |vendor|
              vendor.file_lampiran
        }
    end

end