class CreateCarousels < ActiveRecord::Migration[6.0]
  def change
    create_table :carousels do |t|
      t.string :url
      t.string :alt
      t.text :description

      t.timestamps
    end
  end
end
