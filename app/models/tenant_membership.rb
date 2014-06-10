class TenantMembership < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :user
end
