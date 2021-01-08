class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :author
      t.text :description
      t.string :image_url
      t.text :instructions
      t.string :source
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
