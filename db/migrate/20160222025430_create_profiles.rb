class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :location
      t.string :favorite_food
      t.string :breed
      t.string :behavior
      t.string :activities
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :profiles, :users
  end
end
