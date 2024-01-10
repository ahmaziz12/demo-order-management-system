class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.float :price
      t.integer :quantity
      t.integer :order_type
      t.integer :status, default: 0
      t.references :user

      t.timestamps
    end
  end
end
