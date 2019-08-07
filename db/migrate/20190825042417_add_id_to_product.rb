class AddIdToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :catergory_id, :integer
  end
end
