class CreateExhibitions < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibitions do |t|
      t.text :image
      t.string :name
      t.text :text 
      t.integer :price 
      t.integer :category_id
      t.integer :status_id
      t.integer :fee_id
      t.integer :prefecture_id
      t.integer :delivery_id 
      t.integer :user_id 
      t.timestamps
    end
  end
end
