class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :name
      t.date :date_creat
      t.date :date_update
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
