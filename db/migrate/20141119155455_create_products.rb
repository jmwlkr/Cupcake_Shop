class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :shop_id
      t.text :desc

      t.timestamps
    end
  end
end
