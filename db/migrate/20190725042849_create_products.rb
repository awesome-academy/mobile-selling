class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :color
      t.float :price
      t.integer :amout
      t.text :image
      t.text :status
      t.integer :discount
      t.references :catergory, foreign_key: true

      t.timestamps
    end
  end
end
