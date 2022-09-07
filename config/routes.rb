Rails.application.routes.draw do



  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'home#index'
  get 'master/index', to: "master#index"

  post 'realization_visit_plans/create'
  post 'realization_visit_plans/update'
  post 'project_potentials/create', to: 'project_potentials#create'  
  # post 'sales_visit_plans/create'

  resources :change_passwords, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end
  resources :roles
  resources :users
  resources :data_companies
  resources :categories
  # resources :contacts
  resources :work_units

  # resources :realization_visit_plans 
  # resources :sales_visit_plans, :path => "aktivitas"

  resources :project_potentials do 
    collection do
    end
  end
  resources :contacts do
    collection do
      get "delete_file_lampiran/:attachment_id", to: 'contacts#delete_file_lampiran'  
      get 'cetak_pdf', to: "contacts#cetak_pdf"
    end
  end
  

  resources :activity_sales, :path => "aktivitas" ,only: [:index, :new, :report, :download]  do
    member do 
      get "realisasi", to: "sales_visit_plans#realisasi"
      get "delete_lampiran/:attachment_id", to: 'activity_sales#delete_lampiran'  
    end
    collection do

      resources :realization_visit_plans, :path => "realisasi" do
        member do 
          get "delete_file_lampiran/:attachment_id", to: 'realization_visit_plans#delete_file_lampiran'  
          get "review", to: "realization_visit_plans#review"
          patch 'update_status'
        end
      end

      resources :sales_visit_plans, :path => "rencana" do 
        member do 
          get "delete_file_lampiran/:attachment_id", to: 'sales_visit_plans#delete_file_lampiran'  
          get "review", to: "sales_visit_plans#review"
          post 'review_rencana', to: "sales_visit_plans#review_update_rekap"
        end
      end


      get "rekap", to: "activity_sales#rekap"
      get "status_laporan", to: "activity_sales#status_laporan"
      delete 'status_laporan/:id' => 'activity_sales#status_laporan_destroy'
      resources :status_reports, :path => "status_laporan" 
      get 'cetak_laporan/:id', to: "status_reports#download" , :as => :download  
      get 'cetak_pdf', to: "status_reports#cetak_pdf"
      get 'cetak_excel', to: "status_reports#cetak_excel"
      post '/update' , to: "status_reports#update"
    end
  end


  resources :helper_json do 
    member do
      # datacompany
      get "/getDataCompany", to: "helper_json#getDataCompany"
      get "/getDataCompanyCluster", to: "helper_json#getDataCompanyCluster"
      get "/getDataCompanyCategory", to: "helper_json#getDataCompanyCategory"
      # datacontact
      get "/getDataContact", to: "helper_json#getDataContact"
      get "/getDataContactCluster", to: "helper_json#getDataContactCluster"
      get "/getDataContactCategory", to: "helper_json#getDataContactCategory" 
      get "/getDataContactLokasiKerja", to: "helper_json#getDataContactLokasiKerja" 
      # dataRealisasi
      get "/getDataRealisasi", to: "helper_json#getDataRealisasi"
    end
  end
  # get 'status_laporan/:id/download', to: "activity_sales#download"
  
  
  # resources :categories do
  #   resources :contacts, only: [:index], module: :categories
  # end
  # resources :type_workers

end
