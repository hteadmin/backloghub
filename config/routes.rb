Rails.application.routes.draw do

  root 'index#home'
  get 'testpdf', to: 'index#testpdf'

  constraints(TenantSubdomain) do
    scope :module => 'tenant' do
      resources :products
    end
  end
  get '/templates/:path.html' => 'templates#template', :constraints => { :path => /.+/  }

end
