class HelperJsonController < ApplicationController
    # def editRapidTest
    #     id = params[:id]
    #     render json: RapidTest.select('*')
    #                     .where('id = ?', id)
    #                     .map{ |vendor|
    #                         { 
    #                             :tanggal => vendor.tanggal,
    #                             :hasil_test => vendor.hasil_test, 
    #                         }
    #                     }
    # end

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
end