class Account < ActiveRecord::Base

  validates :subdomain, presence: true

  after_create :create_account_schema
  after_destroy :destroy_account_schema

  private

  def create_account_schema
    Apartment::Database.create(subdomain)
  end

  def destroy_account_schema
    Apartment::Database.drop(subdomain)
  end

end
