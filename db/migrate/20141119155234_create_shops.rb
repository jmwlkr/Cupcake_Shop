class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.integer :user_id
      t.string :address
      t.integer :zip
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
