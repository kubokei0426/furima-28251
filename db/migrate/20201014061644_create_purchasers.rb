class CreatePurchasers < ActiveRecord::Migration[6.0]
  def change
    create_table :purchasers do |t|
      t.integer :exhibition_id ,null: false
      t.integer :user_id ,null: false
      t.integer :shipping_id ,null: false
      t.timestamps
    end
  end
end
