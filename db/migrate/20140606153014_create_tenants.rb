class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :subdomain
      t.integer :owner_id, index: true

      t.timestamps
    end
  end
end
