Rails.application.routes.draw do

  root 'index#home'

  constraints(TenantSubdomain) do
    scope :module => 'tenant' do
    end
  end
  get '/templates/:path.html' => 'templates#template', :constraints => { :path => /.+/  }

end
