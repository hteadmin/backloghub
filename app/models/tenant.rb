class Tenant < ActiveRecord::Base
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