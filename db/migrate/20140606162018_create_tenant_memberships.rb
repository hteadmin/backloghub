class CreateTenantMemberships < ActiveRecord::Migration
  def change
    create_table :tenant_memberships do |t|
      t.references :tenant, index: true
      t.references :user, index: true
      t.string :role

      t.timestamps
    end
  end
end
