class Tenant < ActiveRecord::Base

  has_many :tenant_memberships
  has_many :members, through: :tenant_memberships, class_name: 'User', source: :user
  belongs_to :owner, class_name: 'User'

  validates :name, presence: true, uniqueness: true

  before_create { |tenant| tenant.subdomain = tenant.name.parameterize }
  after_create { |tenant| Apartment::Database.create(subdomain) }
  after_destroy { |tenant| Apartment::Database.drop(subdomain) }

end