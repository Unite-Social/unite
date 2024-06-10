class CreateMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :movements do |t|
      t.string :name
      t.datetime :date
      t.string :rewards
      t.string :description
      t.string :address
      t.string :contact
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
