class CreatePurchasers < ActiveRecord::Migration[6.0]
  def change
    create_table :purchasers do |t|
      t.references :user_id,                 null: false,foreign_key: true
      t.references :exhibition_id,           null: false,foreign_key: true
      t.timestamps
    end
  end
end
