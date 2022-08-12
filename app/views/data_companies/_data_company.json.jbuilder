json.extract! data_company, :id, :category_id, :cluster, :nama_entitas, :area, :lokasi_kerja, :alamat, :website, :daftar_pekerjaan, :created_at, :updated_at
json.url data_company_url(data_company, format: :json)
