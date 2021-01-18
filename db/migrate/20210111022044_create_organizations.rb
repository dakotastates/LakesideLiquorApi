class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :organization
      t.string :phone
      t.string :email
      t.text :about

      t.timestamps
    end
  end
end
