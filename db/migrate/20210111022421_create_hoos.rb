class CreateHoos < ActiveRecord::Migration[6.0]
  def change
    create_table :hoos do |t|
      t.string :sunday
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
      t.string :saturday
      t.belongs_to :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
