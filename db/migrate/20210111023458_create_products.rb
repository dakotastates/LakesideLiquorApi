class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.belongs_to :category, null: false, foreign_key: true
      t.decimal :price
      t.string :image_url

      t.timestamps
    end
  end
end
