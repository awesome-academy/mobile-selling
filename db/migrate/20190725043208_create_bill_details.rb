class CreateBillDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_details do |t|
      t.integer :amount
      t.string :payment_method
      t.float :price
      t.references :product, foreign_key: true
      t.references :bill, foreign_key: true

      t.timestamps
    end
  end
end
