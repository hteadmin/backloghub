class TenantSubdomain
  def self.matches?(request)
    request.subdomain.present? && !Rails.application.secrets.reserved_domains.split.include?(request.subdomain)
  end
end