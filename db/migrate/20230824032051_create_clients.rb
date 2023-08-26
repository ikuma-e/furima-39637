class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.references :order, null: false, foreign_key: true
      t.string :post_code, null: false
      t.integer :delivery_address_id, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :build
      t.string :phone_num, null: false
      t.timestamps
    end
  end
end
