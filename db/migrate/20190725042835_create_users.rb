class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :name
      t.integer :role
      t.text :adress
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
