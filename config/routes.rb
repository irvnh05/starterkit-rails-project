Rails.application.routes.draw do


  resources :project_potentials
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'home#index'
  get 'master/index', to: "master#index"

  post 'realization_visit_plans/create'
  post 'realization_visit_plans/update'

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
  resources :contacts
  resources :work_units

  # resources :realization_visit_plans 
  # resources :sales_visit_plans, :path => "aktivitas"

  resources :activity_sales, :path => "aktivitas" ,only: [:index, :new, :report, :download]  do
    member do 
      get "realisasi", to: "sales_visit_plans#realisasi"
    end
    collection do

      resources :realization_visit_plans, :path => "realisasi"

      resources :sales_visit_plans, :path => "rencana" do 
        member do 
          get "delete_file_lampiran/:attachment_id", to: 'sales_visit_plans#delete_file_lampiran'  
     
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
      get "/getDataCompany", to: "helper_json#getDataCompany"
      get "/getDataCompanyCluster", to: "helper_json#getDataCompanyCluster"
      get "/getDataCompanyCategory", to: "helper_json#getDataCompanyCategory"
    end
  end
  # get 'status_laporan/:id/download', to: "activity_sales#download"
  
  
  # resources :categories do
  #   resources :contacts, only: [:index], module: :categories
  # end
  # resources :type_workers

end
