class CreateExhibitions < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibitions do |t|
      t.text :image,           null: false
      t.string :name,           null: false
      t.text :text,           null: false
      t.integer :price,           null: false
      t.integer :category_id,           null: false
      t.integer :status_id,           null: false
      t.integer :fee_id,           null: false
      t.integer :prefecture_id,           null: false
      t.integer :delivery_id,           null: false
      t.integer :user_id,           null: false
      t.integer :purchaser_id
      t.timestamps
    end
  end
end
