class Tenant::BaseController < ApplicationController
  before_action :load_tenant_from_subdomain
  helper_method :current_tenant

  protected

  def current_tenant
    @current_tenant
  end

  def load_tenant_from_subdomain
    @current_tenant = Tenant.find_by_subdomain!(request.subdomains.first)
  end
end