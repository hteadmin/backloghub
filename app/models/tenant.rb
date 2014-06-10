class Tenant < ActiveRecord::Base

  has_many :tenant_memberships
  has_many :members, through: :tenant_memberships, class_name: 'User', source: :user
  belongs_to :owner, class_name: 'User'

  validates :subdomain, presence: true

  after_create :create_schema
  after_destroy :destroy_schema

  private

  def create_schema
    Apartment::Database.create(subdomain)
  end

  def destroy_schema
    Apartment::Database.drop(subdomain)
  end
end