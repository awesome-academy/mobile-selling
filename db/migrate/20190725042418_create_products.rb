class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :color
      t.float :price
      t.integer :amout
      t.string :image
      t.integer :status
      t.integer :discount

      t.timestamps
    end
  end
end
