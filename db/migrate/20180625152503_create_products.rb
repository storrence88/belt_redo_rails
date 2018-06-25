class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :amount
      t.date :date
      t.references :user, index: true, foreign_key: true
      t.integer :buyer

      t.timestamps null: false
    end
  end
end
