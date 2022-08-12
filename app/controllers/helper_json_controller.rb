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

    # def editVaksinasi
    #     id = params[:id]
    #     render json: Vaccination.select('*')
    #                     .where('id = ?', id)
    #                     .map{ |vendor|
    #                         { 
    #                             :tanggal_pelaksanaan => vendor.tanggal_pelaksanaan,
    #                             :dosis => vendor.dosis, 
    #                         }
    #                     }
    # end

    # def editMCU
    #     id = params[:id]
    #     render json: Mcu.select('*')
    #                     .where('id = ?', id)
    #                     .map{ |vendor|
    #                         { 
    #                             :tanggal_pelaksanaan => vendor.tanggal_pelaksanaan,
    #                             :dosis => vendor.keterangan, 
    #                         }
    #                     }
    # end

    # def getPekerja
    #     id = params[:id]
    #     render json: Worker.select('nama_pekerja')
    #                     .where('kode_proyek LIKE ?', "%#{id}%")
    #                     .map{ |vendor|
    #                         vendor.nama_pekerja
    #                     }
    # end
end